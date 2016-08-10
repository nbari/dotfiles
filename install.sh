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

cd $home

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
  exit
}

if [ ! -d ~/projects ]; then
	echo "making projects directory"
	mkdir ~/projects
fi

if [ ! -d ~/projects/dotfiles ]; then
echo "getting dotfiles..."
hash git clone https://github.com/nbari/dotfiles.git ~/projects/dotfiles || {
  echo "not available to clone dotfiles"
  exit
}
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
  echo "~/.tmux.conf  exists"; else
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

if [ ! -d ~/.vim/autoload/plug.vim ]; then
	echo "getting vim-plug"
	hash curl >/dev/null 2>&1 && curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim && vim +PlugInstall || {
   	 echo "curl not installed or and error occured"
   	 exit
	}
fi

echo "Installing node packages..."
hash npm >/dev/null 2>&1 && env npm install js-beautify js-yaml jsonlint less jslint node-sass || {
  echo "npm not installed"
}

echo "Installing pip packages..."
hash pip >/dev/null 2>&1 && env pip install --user --upgrade autopep8 pyflakes pylint cryptography || {
  echo "pip not installed"
}

echo "To change your default shell to zsh:  chsh -s `which zsh`"
echo "Fin"
