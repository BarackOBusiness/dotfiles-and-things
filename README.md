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
get pipewire working, with ~amd64 keyword this should be a little more simple to do with

___
That is all for now, get to work.

# Things for the user experience
- [Materia GTK Theme](https://github.com/nana-4/materia-theme/blob/master/INSTALL.md)
- [Guilded](https://www.guilded.gg/)
- [Revolt](https://github.com/revoltchat/desktop) (Follow aur to install (make ebuild as well))
- Azote - included in [the-obamids](https://github.com/The-head-obamid/the-obamids)
- [nwg-look](https://github.com/nwg-piotr/nwg-look)
