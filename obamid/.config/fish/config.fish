if status is-interactive
    # Commands to run in interactive sessions can go here
    neofetch
    starship init fish | source
    alias dir=ls
end

# opam configuration
source /home/obamid/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
