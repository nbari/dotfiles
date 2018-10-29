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
  echo "Installing Homebrew ..."
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update

brew install ag && \
brew install autossh && \
brew install cmake && \
brew install dep && \
brew install direnv && \
brew install flatbuffers && \
brew install git --without-completions && \
brew install gnu-tar && \
brew install go && \
brew install hopenpgp-tools && \
brew install imagemagick && \
brew install immortal && \
brew install ipcalc && \
brew install jq && \
brew install ncdu && \
brew install npm && \
brew install par && \
brew install pdsh && \
brew install protobuf && \
brew install pv && \
brew install python && \
brew install reattach-to-user-namespace && \
brew install ripgrep && \
brew install rsync && \
brew install sipcalc && \
brew install speedtest-cli && \
brew install ssh-vault && \
brew install tmux && \
brew install tree && \
brew install vim --with-override-system-vi && \
brew install watch && \
brew install yamllint && \
brew install yq && \
brew install zsh

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

# now=$(date -u +%Y%m%dT%H%M%S)

if [ ! -n "$ZSH" ]; then
    zsh=~/.zsh
fi

if [ ! -d ~/.ssh ]; then
  echo "Creating .ssh dir"
  mkdir ~/.ssh
fi

if [ ! -f  ~/.ssh/authorized_keys ]; then
echo "adding ssh key"
cat >> ~/.ssh/authorized_keys << 'ssh/authorized_keys'
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDCu3MS7nQxGaOZJiU3Nq65JXRuggfRSPuhwqOD0r5Dcs2E9swP1enZVvHsadED0v+rOBmXPB5a9IJuTg71wB/rCmDLZ+UxOyA8DPfM/1wexM4qv7AI38lz1qb/pNePL/AcsHz5hxKJcYGdPY/Dpta0r2tcu9zp1540vfjfjFUftxoJ49fJ4UM5pQUBerhf1Vorl6uXt3wdJ3kZ45WU1lDRp5Nhi2BwngGa51kAylnO/IJkfYMj+nU7VgiMpNUj2KGbZRmhtKyPzKo8D2m4a9fS/vwjoZpG3Z5uB/HauzXz1vvWEG1EKSviYmd1u5kjHYPbjTjCtETfm6gWy8uRSQJP9ndYgp10z8qwlhTp3To0oOlkMKjzYNfMhit4/xNrusiD7yBJPtYf90ErPVnGmQhbeleSeAaoW26+5r+xJZPVzcESM1pt7dhqWMo6bCuwc7blPO0QiEwii2UBVWqFB7oHJEnQTsJ9exvfxDsFirVARFXjzocK1c6txF0zJ+hLbPuzTkJ/9iS9YlUBmQNWEDIAUHEpFievem/28bcRIkrdFQEku1L3PDq7EEUK3jkLl7Qo3/ONkZ+hBjriZ5HrmtOzeel6n8Qcq4b2wepWX+FgfpjP18c9peS9Dk2nvJ1tDmZifNrHreH6O+mvQDOxRp51B835Mn8L+/4NSww4tQbP0Q== devops
ssh/authorized_keys
fi

hash git >/dev/null 2>&1 ||  {
  echo "git not installed"
  exit 1
}

if [ ! -d ~/projects ]; then
	echo "making projects directory"
	mkdir ~/projects
fi

if [ ! -d ~/projects/go ]; then
	echo "making projects/go directory"
	mkdir ~/projects/go
	mkdir ~/projects/go/bin
	mkdir ~/projects/go/src
	mkdir ~/projects/go/pkg
fi

if [ ! -d ~/projects/dotfiles ]; then
    echo "getting dotfiles..."
    git clone git@github.com:nbari/dotfiles.git ~/projects/dotfiles
    if [ $? -ne 0 ]; then
        echo "Could not clone dotfiles"
        exit 1
    fi
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

echo "Installing fonts"
sudo find ~/projects/dotfiles -name "*.ttf" -exec cp {} /Library/Fonts/ \;

if [ ! -f ~/Pictures/polignano.jpg ]; then
	cp ~/projects/dotfiles/background/polignano.jpg ~/Pictures/
fi

echo "fixing .ssh perms to id_keys"
find ~/.ssh/* -type f -name "id*" -not -iname "*.pub" -exec chmod 0400 {} \+

echo ""
echo "After loading the shell (zsh, go path, etc) do this: vim +PlugInstall +qall"
echo ""
echo "Fin"
