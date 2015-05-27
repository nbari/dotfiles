my-vim
======

* .vimrc (default) requires to have .vim directory
* .vimrc-16 (single file, no plugins, specially for servers, not properly for development)

Mac OS X Terminal.app in Snow Leopard does not support 256 colors

256colors2.pl - script to check colors in your term

color.vim - a script that displays a sample of all 256 cterm color, from any buffer type: ":so color.vim"


To install my-vim do this:

    cd ~
    git clone git://github.com/nbari/my-vim.git
    cd my-vim
    ln -s my-vim/.vim .
    ln -s my-vim/.vimrc .
    ln -s my-vim/.tmux.conf .

Install vundle:

    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

Install plugins

    :PluginInstall
    vim +PluginInstall +qall


For the autoformater plugin:

    npm install js-beautify -g
    pip install --user autopep8
    pip install --user --upgrade pyflakes

For YAML:

    npm install -g js-yaml


Install Par text reformatter (,w) see: http://www.nicemice.net/par/, From FreebSD ports:

    cd /usr/ports/textproc/par
    make install clean


Install jsonlint with npm to use the command line interface:

    npm install jsonlint -g

Compiling Less Files from Vim every save action

    npm install less -g


for complementing the syntax checks on python run this on a terminal
` pylint --generate-rcfile > ~/.pylintrc`

optional add this to the [MESSAGES CONTROL] area

disable=C0103,C0111,C0302,I0010,I0011,R0801,R0901,R0902,R0903,R0904,R0911,R0912,R0913,R0914,R0915,R0921,R0922,W0122,W0141,W0142,W0402,W0404,W0511,W0603,W0703,W1201,W0105,E501

For the syntastic plugin install from FreeBSD ports:

    cd /usr/ports/devel/pylint/
    make install clean

    cd /usr/ports/www/closure-compiler/
    make install clean

for jslint

    /usr/ports/devel/jsl
    make install clean

on MAC download from  http://www.javascriptlint.com/download.htm and install with:

    sudo install -c -o $USER jsl /usr/local/bin

Move vim & tmux

    <C-h> go left
    <C-j> go down
    <C-k> go up
    <C-l> go right


In both vim & tmux only need to press once <c-w> (vim) or <c-b> (tmux) and repeat h,j,k,l as desired, example:

    vim:  <C-w>jjj
    tmux: <C-b>kkk


Resize vim

    <C-w>h
    <C-w>j
    <C-w>k
    <C-w>l

Resize tmux

    <C-b>h
    <C-b>j
    <C-b>k
    <C-b>l


tmux compatible splits in vim

    <C-w>" horizontal split
    <C-w>% vertical split
    <C-w>! open current window in new tab


for PHP debuging (xdebug) in csh:

    setenv XDEBUG_CONFIG "idekey=xdebug"


Add these options to the INI file:

    zend_extension=/path/to/xdebug.so
    xdebug.remote_enable=on
    xdebug.remote_handler=dbgp
    xdebug.remote_host=localhost
    xdebug.remote_port=9000


Write startup timing messages to vim.log
    vim --startuptime vim.log


AUTOSSH + TMUX
--------------

csh Alias:

    ssh_example (autossh -M 0 -t 1.2.3.4 "tmux attach -t nbari!:1 -d || tmux new -s nbari!:1 ")
