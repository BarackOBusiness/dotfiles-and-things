if status is-interactive
    # Commands to run in interactive sessions can go here
    fastfetch
    starship init fish | source
    export "MICRO_TRUECOLOR=1"
    alias dir=ls

    # https://ffmpeg.org
    alias ffmpeg="ffmpeg -hide_banner"
    alias ffprobe="ffprobe -hide_banner"
    alias ffplay="ffplay -hide_banner"
    
    alias hexedit="hexedit --color"
    
    alias mvi="mpv --config-dir=/home/obamid/.config/mvi/"
    alias Friday="mpv --vo=tct /home/obamid/Videos/Days/Friday.mp4"

    alias ohyea="echo wooyea"
    alias OHYEA="echo WOOYEA"
end

# opam configuration
#source /home/obamid/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
