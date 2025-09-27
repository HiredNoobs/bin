# bin

Two main scripts are ``movein.sh`` and ``setup``.

``movein.sh`` is for the initial setup - it clones this repo, sets up a new user with sudo access, and sets up symlinks for everything in ``dotfiles``.

``movein.sh`` is intended to be run as root on the first login to a new host/vm/lxc.

``movein.sh`` usage:

```bash
curl -L https://bit.ly/HiredMove | bash -s [username]
```

``setup`` is for installing optional extras and configuring them.

``setup`` usage:

```bash
setup COMMAND
```

``setup help`` can be used to see all the available options.
