# dotfiles


Backup
------

The ``install.sh`` script  will create/overwrite the ``$HOME/.[cz]shrc`` file, and
also create an ``$HOME/.zsh`` directory, please backup if needed.


Setup
-----

Before starting, check that you have your keys in `~/.ssh`, then run:

    $ curl -Ls https://raw.githubusercontent.com/nbari/dotfiles/master/install.sh | sh

Everything is installed within your ``$HOME`` directory.


SSH
---

Add to `~/Library/LaunchAgents` the file `ssh.plist` to force using keychain and
not asking for ssh passwords.
