# dotfiles


Backup
------

The ``install.sh`` script  will create/overwrite the ``$HOME/.[cz]shrc`` file, and
also create an ``$HOME/.zsh`` directory, please backup if needed.


Setup
-----

Install first `brew`:

	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

clone the repo and run:

    brew bundle


---

To fix:

    zsh compinit: insecure directories, run compaudit for list.

run:
    compaudit | xargs chmod g-w
