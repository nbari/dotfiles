# dotfiles


Backup
------

The ``install.sh`` script  will create/overwrite the ``$HOME/.[cz]shrc`` file, and
also create an ``$HOME/.zsh`` directory, please backup if needed.


Setup
-----

Run:

	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/nbari/dotfiles/refs/heads/master/install.sh)"


---

To fix:

    zsh compinit: insecure directories, run compaudit for list.

run:
    compaudit | xargs chmod g-w
