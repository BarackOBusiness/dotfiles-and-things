# Some instructions for future me

**VOID LINUX DREAM IS DEAD**\
**INSTALLATION IS FUEL**\
**GENTOO IS FULL**

## Things to install

Game plan: [Install gentoo](https://wiki.gentoo.org/wiki/Handbook:AMD64/Installation/About) under the following criteria:
* Uses [gentoobry overlay](https://github.com/gentoobr/overlay) for xanmod sources
* Replaces OpenRC with [66](https://framagit.org/gentoo-66/66tools-overlay/-/tree/master)
* Employs usage of btrfs subvolumes for snapshots
* Makes use of lto-overlay with gcc graphite

Main first step to getting the system how you want it:\
Accept the ~amd64 keyword\
Install eselect repository and git\
Re-emerge gcc with graphite, then you're free to continue installation as necessary

Install needed tools like doas, micro, ufw, whatever\
Install dbus, elogind, seatd or seat or whatever\
Reboot with those services enabled\
Install gtkgreet\
Prepare for GUI.

## Phase 2

Research use flags so you can consider the following:\
Install sway, all the shit that lets graphical applications work + kitty + firefox + rofi + shit\
verify sway works, then start syncing with this config\
get pipewire working, with ~amd64 keyword this should be a little more simple to do with pulseaudio shit\
install [fonts](https://github.com/ryanoasis/nerd-fonts), mononoki, fira code

## Some tips
Remember to modularize system config as much as possible, try not to pollute the environment with tons of global use flags.\
For example, I had the desktop environment put in a `desktop-env` package.use file with all the components of sway there.


**Global Use flags for inspiration**
___
USE="graphite lto asm default-compiler-rt default-lld llvm-libunwind pie \
btrfs initramfs tasktype \
man dbus elogind -systemd egl vulkan opengl openal \
wayland X network wifi bluetooth pulseaudio screencast libnotify \
10bit vdpau v4l lv2 threads jpegxl avif webp jpeg jpeg2k fdk opus dav1d openh264"

# Things for the user experience
- [Materia GTK Theme](https://github.com/nana-4/materia-theme/blob/master/INSTALL.md)
- [Guilded](https://www.guilded.gg/)
- [Revolt](https://github.com/revoltchat/desktop) (Follow aur to install (make ebuild as well))
- Azote - included in [the-obamids](https://github.com/The-head-obamid/the-obamids)
- [nwg-look](https://github.com/nwg-piotr/nwg-look)
