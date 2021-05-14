set -e

# ----------------------------------------------------------------------------
#  -d FILE
#         FILE exists and is a directory
#  -e FILE
#         FILE exists
#  -f FILE
#         FILE exists and is a regular file
#  -h FILE
#         FILE exists and is a symbolic link (same as -L)
#  -r FILE
#         FILE exists and is readable
#  -s FILE
#         FILE exists and has a size greater than zero
#  -w FILE
#         FILE exists and is writable
#  -x FILE
#         FILE exists and is executable
#  -z STRING
#         the length of STRING is zero
# ----------------------------------------------------------------------------

if ! command -v brew >/dev/null; then
    echo "Install Homebrew"
    exit 1
fi

brew update

brew install ag && \
    brew install aria2 && \
    brew install --HEAD mosh && \
    brew install autossh && \
    brew install cmake && \
    brew install curl && \
    brew install fd && \
    brew install direnv && \
    brew install flatbuffers && \
    brew install git && \
    brew install git-lfs && \
    brew install gnu-tar && \
    brew install gnupg && \
    brew install go && \
    brew install httpie && \
    brew install hugo && \
    brew install imagemagick && \
    brew install immortal && \
    brew install ipcalc && \
    brew install jq && \
    brew install libsodium && \
    brew install libpq && \
    brew install lz4 && \
    brew install mycli && \
    brew install ncdu && \
    brew install npm && \
    brew install p7zip && \
    brew install par && \
    brew install pdsh && \
    brew install pigz && \
    brew install pinentry-mac && \
    brew install protobuf && \
    brew install prototool && \
    brew install pssh && \
    brew install pv && \
    brew install pyenv && \
    brew install python && \
    brew install reattach-to-user-namespace && \
    brew install ripgrep && \
    brew install rsync && \
    brew install sipcalc && \
    brew install speedtest-cli && \
#:    brew install ssh-vault && \
    brew install tmux && \
    brew install tree && \
    brew install tty-share && \
    brew install vim && \
    brew install watch && \
    brew install wireguard-tools && \
    brew install yamllint && \
    brew install yq && \
    brew install zsh && \
    brew install zstd && \
    brew install --cask barrier && \
    brew install --cask clipy && \
    brew install --cask docker && \
    brew install --cask karabiner-elements && \
    brew install --cask menumeters && \
    brew install --cask mysqlworkbench && \
    brew install --cask postman && \
    brew install --cask resilio-sync && \
    brew install --cask transmission && \
    brew install --cask transmit && \
    brew install --cask tunnelblick && \
    brew install --cask virtualbox && \
    brew install --cask vlc && \
    brew install --cask vmware-fusion && \
    brew install --cask wireshark

hash zsh >/dev/null 2>&1 ||  {
    echo "zsh not installed"
    exit 1
}

if grep -Fxq "/usr/local/bin/zsh" /etc/shells
then
    echo "zsh found"
else
    echo "/usr/local/bin/zsh" | sudo tee -a /etc/shells
fi

# change default shell
if finger $USER | grep -q "/usr/local/bin/zsh"
then
    echo "using zsh"
else
    chsh -s /usr/local/bin/zsh
fi

cd $HOME

if [ ! -n "$ZSH" ]; then
    zsh=~/.zsh
fi

if [ ! -d ~/.ssh ]; then
    echo "Creating .ssh dir"
    mkdir ~/.ssh
fi

hash git >/dev/null 2>&1 ||  {
    echo "git not installed"
    exit 1
}

if [ ! -d ~/projects ]; then
    echo "making projects directory"
    mkdir ~/projects
fi


if [ -d ~/.zsh ] || [ -h ~/.zsh ]; then
    echo "~/.zsh exists";
else
    echo "creating .zsh link"
    ln -s ~/projects/dotfiles/my-dotfiles/.zsh $ZSH
fi

if [ -f ~/.zshrc ] || [ -h ~/.zshrc ]; then
    echo "~/.zshrc exists"; else
    echo "creating .zshrc link"
    ln -s ~/projects/dotfiles/my-dotfiles/.zshrc ~/.zshrc
fi

if [ -f ~/.cshrc ] || [ -h ~/.cshrc ]; then
    echo "~/.cshrc exists"; else
    echo "creating .cshrc link"
    ln -s ~/projects/dotfiles/my-dotfiles/.cshrc ~/.cshrc
fi

if [ -f ~/.tmux.conf ] || [ -h ~/.tmux.conf ]; then
    echo "~/.tmux.conf exists"; else
    echo "creating .tmux.conf link"
    ln -s ~/projects/dotfiles/my-dotfiles/.tmux.conf
fi

if [ -h ~/.vim ] && [ -d ~/.vim ]; then
    echo ".vim dir exists"; else
    echo "creating .vim link"
    ln -s ~/projects/dotfiles/my-dotfiles/.vim ~/.vim
fi

if [ -f ~/.vimrc ] && [ -h ~/.vimrc ]; then
    echo ".vimrc dir exists"; else
    echo "creating .vimrc link"
    ln -s ~/projects/dotfiles/my-dotfiles/.vimrc ~/.vimrc
fi

#echo "Installing node packages..."
#hash npm >/dev/null 2>&1 && env npm install js-beautify js-yaml jsonlint less jslint node-sass || {
#    echo "npm not installed"
#}

echo "Add new python to PATH"
export PATH=/usr/local/opt/python/libexec/bin:$PATH

echo "Installing pip packages..."
hash pip >/dev/null 2>&1 && env pip install --user --upgrade ansible pipenv autopep8 pyflakes pylint cryptography || {
    echo "pip not installed (python -m ensurepip --upgrade)"
}

#echo "Installing fonts"
#sudo find ~/projects/dotfiles -name "*.ttf" -exec cp {} /Library/Fonts/ \;

if [ ! -f ~/Pictures/polignano.jpg ]; then
    cp ~/projects/dotfiles/background/polignano.jpg ~/Pictures/
fi

echo "fixing .ssh perms to id_keys"
find ~/.ssh/* -type f -name "id*" -not -iname "*.pub" -exec chmod 0400 {} \+

echo ""
echo "After loading the shell (zsh, go path, etc) do this: vim +PlugInstall +qall"
echo ""
echo "Fin"
