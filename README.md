# dotfiles


Backup
------

The ``install.sh`` script  will create/overwrite the ``$HOME/.[cz]shrc`` file, and
also create an ``$HOME/.zsh`` directory, please backup if needed.

Requirements
------------

* curl
* git
* npm (node.js)
* vim
* zsh
* tmux

Setup
-----

Open a terminal and type this:

    $ curl -L https://raw.githubusercontent.com/nbari/dotfiles/master/install.sh | sh

Everything is installed within your ``$HOME`` directory.


VIM
---

Update vim on mac with:

    brew install vim --override-system-vi
