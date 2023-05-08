**PC IS DEAD**\
**INSTALLATION IS FUEL**\
**NEW PC IS FULL** (Disclaimer: Doesn't exist yet.)

# Instructions for future me.

Fresh Kiss linux install on the new ssd, partition 1 tb to root and 1 tb to /home\
Replace gcc with llvm/clang, replace libstdc++ with libcxx, build kernel with zen patches, BMQ scheduler, and optimize for zen 3, set thinLTO and build with LLVM=1 LLVM_IAS=1\
Make some recipes for some things to get started, presumably wlroots, hyprland, xdg desktop protocol hypr, once that's all worked out, get to replacing runit with 66.\
Full successful install with 66 should incorporate: mdevd as udev replacement, no logind, boot-user module starting a greetd greeter, and rc.local script that sets gpu power profile, written in execline\
Install [junest](https://github.com/fsquillace/junest), this is where lebron games will go and be run, if glibc chroot causes problems in gaming, go back to gentoo (has nothing to do with lebron)\
Then get rust installed and zig and all that, setup userspace as necessary, try and actually get half of the lapce functions working.

# Backup plan
Should I need to go back to gentoo, do the installation process, replace openRC with 66, the reason it didn't work is because of the kernel config, so:\
start with the genkernel config, clone the latest kernel sources, apply the gentoo and zen patchset, optimize as stated above, need to setup llvm toolchain, so get that done\
build that kernel, then everything should work fine, then uninstall logind, and get started with seatd and mdevd, apply user groups and all that, try and get greetd working as stated above\
Do as is necessary.\
NO LTO OVERLAY. ONLY OPTIMIZE THE PROGRAMS WITHIN REASON. DO NOT COMPULSIVELY APPLY COMPILER FLAGS. DO NOT GLOBALLY APPLY THE ~AMD64 FLAG

# Other things
Remember to update these dotfiles once you get a working pc and can mount the old drive and backup the config
