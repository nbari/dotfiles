# my-zsh
zsh - the Z shell

Backup
======

The ``install.sh`` script  will create/overwrite the ``$HOME/.zshrc`` file, and
also create an ``$HOME/.zsh`` directory, please backup if needed.

Setup
=====

Open a terminal and change to your $HOME directory:

    $ cd

Next execure this:

    $ curl -L https://raw.github.com/nbari/my-shell/master/zsh/install.sh | sh

Start using zsh:

    $ zsh

A Non-blocking Prompt
=====================

This problem can be solved using an asynchronously updated shell prompt, using a
technique that is fairly straightforward to implement in zsh. The shell supports
displaying a prompt on both the left and right sides of the screen by setting
``PROMPT`` and ``RPROMPT``. Separating information between the two parts,
information that is slow to update can be kept in the right side prompt. The
shell can be configured to update the left prompt synchronously and update the
right prompt asynchronously, providing a smooth user experience.

The general method for updating the prompt asynchronously is to fork off
processes to compute the information in the background and send a signal to the
shell once the information is ready. Then, the shell can read in and display
this information, updating the prompt.

http://www.anishathalye.com/2015/02/07/an-asynchronous-shell-prompt/


What should/shouldn't go in .zshenv, .zshrc, .zlogin, .zprofile, .zlogout?
==========================================================================

- Since `.zshenv` is always sourced, it often contains exported variables that
should be available to other programs. For example, `$PATH`, `$EDITOR`, and
`$PAGER` are often set in `.zshenv`. Also, you can set `$ZDOTDIR` in `.zshenv`
to specify an alternative location for the rest of your zsh configuration.

- `.zshrc` is for interactive shell configuration. You set options for the
interactive shell there with the `setopt` and `unsetopt` commands. You can also
load shell modules, set your history options, change your prompt, set up zle and
completion, et cetera. You also set any variables that are only used in the
interactive shell (e.g. `$LS_COLORS`).

- `.zlogin` is sourced on the start of a login shell. This file is often used to
start X using `startx`. Some systems start X on boot, so this file is not always
very useful.

- `.zprofile` is basically the same as `.zlogin` except that it's sourced
directly before `.zshrc` is sourced instead of directly after it. According to
the zsh documentation, `.zprofile` is meant as an alternative to `.zlogin` for
ksh fans; the two are not intended to be used together, although this could
certainly be done if desired."

- `.zlogout` is sometimes used to clear and reset the terminal.
