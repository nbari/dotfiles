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

    $ curl -L -H 'Cache-Control: no-cache' -s https://raw.githubusercontent.com/nbari/dotfiles/master/install.sh | sh

Everything is installed within your ``$HOME`` directory.


VIM
---

Update vim on mac with:

    brew install vim --with-override-system-vi


GIT
---

Update git:

    brew install git --without-completions


ZSH
---

Update zsh using Homebrew:

	# check the zsh info
	brew info zsh

	# install zsh
	brew install zsh

	# add shell path
	sudo vim /etc/shells

	# add the following line into the very end of the file(/etc/shells)
	/usr/local/bin/zsh

	# change default shell
	chsh -s /usr/local/bin/zsh

brew
----

Install extra packages:

    brew install tree colordiff ack
