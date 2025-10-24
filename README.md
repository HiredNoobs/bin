# bin

## Move in

**This script only supports debian!** It's main use is setting up debian LXCs for other use cases just clone the repo.

``movein.sh`` is for the initial setup - it sets up a new user with sudo access and clones this repo to it's home directory.

``movein.sh`` is intended to be run as root on the first login to a new host/VM/LXC. It is intended to be run as ``root``.

``movein.sh`` usage:

```bash
curl -L https://bit.ly/HiredMove | bash -s [username]
```

After running you should update the password for the new user with ``passwd [username]``.

## Setup

``setup`` is for installing optional extras and configuring them. ``setup`` may expect access to ``sudo`` for some options.

``setup`` usage:

```bash
setup COMMAND
```

``setup help`` can be used to see all the available options.

### Bash

Configure bash with ``bashrc``. The bashrc is mostly a wrapper to load content from ``.config/bashrc``.

This does add this repo to the ``$PATH``.

### Hyprland (WIP)

For Arch only.

Included is a very basic Hyprland configuration.

The initial confiuration is based on the following repos:

Hyprland: [gaurav23b's simple-hyprland](https://github.com/gaurav23b/simple-hyprland)
Hyprland: [end-4's dotfiles](https://github.com/end-4/dots-hyprland)
Waybar: [elifouts' dotfiles](https://github.com/elifouts/Dotfiles)
Wallpapers: [nordic-wallpapers](https://github.com/linuxdotexe/nordic-wallpapers)
Notification center: [ML4W dotfiles](https://github.com/mylinuxforwork/dotfiles)
