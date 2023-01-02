// LICENSE
// =======
// Copyright (c) 2017-2019 Advanced Micro Devices, Inc. All rights reserved.
// -------
// Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation
// files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy,
// modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the
// Software is furnished to do so, subject to the following conditions:
// -------
// The above copyright notice and this permission notice shall be included in all copies or substantial portions of the
// Software.
// -------
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
// WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE AUTHORS OR
// COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
// ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE

//Initial port to ReShade: SLSNe    https://gist.github.com/SLSNe/bbaf2d77db0b2a2a0755df581b3cf00c
//Optimizations by Marty McFly:
//     vectorized math, even with scalar gcn hardware this should work
//     out the same, order of operations has not changed
//     For some reason, it went from 64 to 48 instructions, a lot of MOV gone
//     Also modified the way the final window is calculated
//      
//     reordered min() and max() operations, from 11 down to 9 registers    
//
//     restructured final weighting, 49 -> 48 instructions
//
//     delayed RCP to replace SQRT with RSQRT
//
//     removed the saturate() from the control var as it is clamped
//     by UI manager already, 48 -> 47 instructions
//
//     replaced tex2D with tex2Doffset intrinsic (address offset by immediate integer)
//     47 -> 43 instructions
//     9 -> 8 registers
//Further modified by OopyDoopy and Lord of Lunacy:
//		Changed wording in the UI for the existing variable and added a new variable and relevant code to adjust sharpening strength.
//Fix by Lord of Lunacy:
//		Made the shader use a linear colorspace rather than sRGB, as recommended by the original AMD documentation from FidelityFX.
//

#include "ReShade.fxh"
#include "ReShadeUI.fxh"

texture TexColor : COLOR;
sampler sTexColor {Texture = TexColor; SRGBTexture = true;};

uniform float Contrast <
    ui_type = "slider";
    ui_label = "Contrast Adaptation";
    ui_tooltip = "Adjusts the range the shader adapts to high contrast (0 is not all the way off).  Higher values = more high contrast sharpening.";
	ui_min = 0.0; ui_max = 1.0;
> = 0.0;

uniform float Sharpening <
	ui_type = "drag";
    ui_label = "Sharpening intensity";
    ui_tooltip = "Adjusts sharpening intensity by averaging the original pixels to the sharpened result.  1.0 is the unmodified default.";
	ui_min = 0.0; ui_max = 2.0;
> = 1.0;

uniform bool enable_depth <
    ui_label = "Enable depth based adjustments.\nMake sure you have setup your depth buffer correctly.";
    ui_category = "Sharpening: Depth";
    ui_category_closed = true;
    > = false;
uniform bool enable_reverse <
    ui_label = "Reverses the effect (sharpen far, or sharpen close)";
    ui_category = "Sharpening: Depth";
    > = true;
uniform bool display_depth <
    ui_label = "Show depth texture";
    ui_category = "Sharpening: Depth";
    > = false;

uniform float depthStart <
    ui_type = "slider";
    ui_label = "Change Depth Start Plane";
    ui_tooltip = "Change Depth Start Plane";
    ui_category = "Sharpening: Depth";
    ui_min = 0.0f;
    ui_max = 1.0f;
    > = 0.0;

uniform float depthEnd <
    ui_type = "slider";
    ui_label = "Change Depth End Plane";
    ui_category = "Sharpening: Depth";
    ui_min = 0.0f;
    ui_max = 1.0f;
    > = 0.1;
    
uniform float depthCurve <
    ui_label = "Depth Curve Adjustment";
    ui_tooltip = "Depth Curve Adjustment";
    ui_category = "Sharpening: Depth";
    ui_type = "slider";
    ui_min = 0.05;
    ui_max = 8.0;
    > = 1.0;

uniform bool EnableDepthMask <
	ui_label = "Enable Edge Masking";
	ui_tooltip = "Depth high-pass mask switch";
	ui_category = "Sharpening: Depth Mask";
	ui_category_closed = true;
> = false;

uniform float Offset < __UNIFORM_SLIDER_FLOAT1
	ui_label = "Radius";
	ui_tooltip = "Depth Edge offset in pixels";
	ui_min = 0.0; ui_max = 2.0; ui_step = 0.01;
    ui_category = "Sharpening: Depth Mask";
> = 0.1;
uniform int DepthMaskContrast < __UNIFORM_DRAG_INT1
	ui_label = "Edges mask strength";
	ui_tooltip = "Depth Edge mask amount";
	ui_min = 0; ui_max = 2000; ui_step = 1;
    ui_category = "Sharpening: Depth Mask";
> = 128;

uniform bool Preview <
	ui_label = "Preview sharpen layer";
	ui_tooltip = "Preview sharpen layer and mask for adjustment.\n";
	ui_category = "Sharpening: Depth Mask";
> = false;



texture depthTex 	
{ 
	Width = BUFFER_WIDTH;   
	Height = BUFFER_HEIGHT;   
	Format = R16F;  
};

sampler depthLinearSampler
{
	Texture = depthTex;
};

float3 CASPass(float4 vpos : SV_Position, float2 texcoord : TexCoord, float4 offset[3] : TEXCOORD1) : SV_Target
{    

    // fetch a 3x3 neighborhood around the pixel 'e',
    //  a b c
    //  d(e)f
    //  g h i
    float3 a = tex2Doffset(sTexColor, texcoord, int2(-1, -1)).rgb;
    float3 b = tex2Doffset(sTexColor, texcoord, int2(0, -1)).rgb;
    float3 c = tex2Doffset(sTexColor, texcoord, int2(1, -1)).rgb;
    float3 d = tex2Doffset(sTexColor, texcoord, int2(-1, 0)).rgb;
    float3 e = tex2Doffset(sTexColor, texcoord, int2(0, 0)).rgb;
    float3 f = tex2Doffset(sTexColor, texcoord, int2(1, 0)).rgb;
    float3 g = tex2Doffset(sTexColor, texcoord, int2(-1, 1)).rgb;
    float3 h = tex2Doffset(sTexColor, texcoord, int2(0, 1)).rgb;
    float3 i = tex2Doffset(sTexColor, texcoord, int2(1, 1)).rgb;
  
	// Soft min and max.
	//  a b c             b
	//  d e f * 0.5  +  d e f * 0.5
	//  g h i             h
    // These are 2.0x bigger (factored out the extra multiply).
    float3 mnRGB = min(min(min(d, e), min(f, b)), h);
    float3 mnRGB2 = min(mnRGB, min(min(a, c), min(g, i)));
    mnRGB += mnRGB2;

    float3 mxRGB = max(max(max(d, e), max(f, b)), h);
    float3 mxRGB2 = max(mxRGB, max(max(a, c), max(g, i)));
    mxRGB += mxRGB2;

    // Smooth minimum distance to signal limit divided by smooth max.
    float3 rcpMRGB = rcp(mxRGB);
    float3 ampRGB = saturate(min(mnRGB, 2.0 - mxRGB) * rcpMRGB);    
    
    // Shaping amount of sharpening.
    ampRGB = rsqrt(ampRGB);
    
    float peak = 8.0 - 3.0 * Contrast;
    float3 wRGB = -rcp(ampRGB * peak);

    float3 rcpWeightRGB = rcp(1.0 + 4.0 * wRGB);


    float depth = 1;
    float DepthMask = 1;

    if(enable_depth)
    {
        depth      = ReShade::GetLinearizedDepth( texcoord ).x;
        depth      = smoothstep( 0, depthEnd, depth);
        depth      = pow( depth, depthCurve );
        depth            = enable_reverse ? 1.0f - depth : depth;

    }
    if(EnableDepthMask)
    {
        // Get pixel size
	    float2 Pixel = ReShade::PixelSize;
		float2 DepthPixel = Pixel*Offset + Pixel;
		Pixel *= Offset;
	
		float2 NorSouWesEst[4] = {
			float2(texcoord.x, texcoord.y + Pixel.y),
			float2(texcoord.x, texcoord.y - Pixel.y),
			float2(texcoord.x + Pixel.x, texcoord.y),
			float2(texcoord.x - Pixel.x, texcoord.y)
		};

		float2 DepthNorSouWesEst[4] = {
			float2(texcoord.x, texcoord.y + DepthPixel.y),
			float2(texcoord.x, texcoord.y - DepthPixel.y),
			float2(texcoord.x + DepthPixel.x, texcoord.y),
			float2(texcoord.x - DepthPixel.x, texcoord.y)
		};

		DepthMask = 0.0;
	
		[unroll]for(int s = 0; s < 4; s++)
		{
			DepthMask += ReShade::GetLinearizedDepth(NorSouWesEst[s])
			+ ReShade::GetLinearizedDepth(DepthNorSouWesEst[s]);
		}

		DepthMask = 1.0 - DepthMask * 0.125 + ReShade::GetLinearizedDepth( texcoord ).x;
		DepthMask = min(1.0, DepthMask) + 1.0 - max(1.0, DepthMask);
		DepthMask = saturate(DepthMaskContrast * DepthMask + 1.0 - DepthMaskContrast);

        float3 window = (b + d) + (f + h);
        float3 outColor = saturate((window * wRGB + e) * rcpWeightRGB);
        outColor = lerp(e, outColor, Sharpening * depth * DepthMask);
        outColor.xyz  = display_depth * enable_depth ? depth : outColor.xyz;
        if(Preview) // Preview mode ON
        {
            return DepthMask * outColor.xyz;
        }
        return outColor;
    }

    //                          0 w 0
    //  Filter shape:           w 1 w
    //                          0 w 0  
    float3 window = (b + d) + (f + h);
    float3 outColor = saturate((window * wRGB + e) * rcpWeightRGB);
    outColor = lerp(e, outColor, Sharpening * depth * DepthMask);
    outColor.xyz  = display_depth * enable_depth ? depth.xxx : outColor.xyz;

    return outColor;
}

technique ContrastAdaptiveSharpenWithDepth
{
	pass
	{
		VertexShader = PostProcessVS;
		PixelShader = CASPass;
		SRGBWriteEnable = true;
	}
}
