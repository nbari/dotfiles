set -e

cd $HOME

NOW=$(date -u +%Y%m%dT%H%M%S)

if [ ! -n "$ZSH" ]; then
    ZSH=~/.zsh
fi

if [ -d "$ZSH" ]; then
  echo "Backing up .zsh dir"
  mv ~/.zsh ~/.zsh.${NOW}
fi

if [ -d ~/.vim ]; then
  echo "Backing up .vim dir"
  mv ~/.vim ~/.vim.${NOW}
fi

echo "Looking for an existing zsh config..."
if [ -f ~/.zshrc ] || [ -h ~/.zshrc ]; then
  echo "Found ~/.zshrc. Backing up to ~/.zshrc.${NOW}";
  mv ~/.zshrc ~/.zshrc.${NOW};
fi

echo "Looking for an existing csh config..."
if [ -f ~/.cshrc ] || [ -h ~/.cshrc ]; then
  echo "Found ~/.cshrc. Backing up to ~/.cshrc.${NOW}";
  mv ~/.cshrc ~/.cshrc.${NOW};
fi

echo "Looking for an existing tmux config..."
if [ -f ~/.tmux.conf ] || [ -h ~/.tmux.conf ]; then
  echo "Found ~/.tmux.conf. Backing up to ~/.tmux.conf.${NOW}";
  mv ~/.tmux.conf ~/.tmux.conf.${NOW};
fi

if [ ! -d ~/.ssh ]; then
  echo "Creating .ssh dir"
  mkdir ~/.ssh
fi

echo "Adding ssh key"
cat >> ~/.ssh/authorized_keys << 'ssh/authorized_keys'
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDCu3MS7nQxGaOZJiU3Nq65JXRuggfRSPuhwqOD0r5Dcs2E9swP1enZVvHsadED0v+rOBmXPB5a9IJuTg71wB/rCmDLZ+UxOyA8DPfM/1wexM4qv7AI38lz1qb/pNePL/AcsHz5hxKJcYGdPY/Dpta0r2tcu9zp1540vfjfjFUftxoJ49fJ4UM5pQUBerhf1Vorl6uXt3wdJ3kZ45WU1lDRp5Nhi2BwngGa51kAylnO/IJkfYMj+nU7VgiMpNUj2KGbZRmhtKyPzKo8D2m4a9fS/vwjoZpG3Z5uB/HauzXz1vvWEG1EKSviYmd1u5kjHYPbjTjCtETfm6gWy8uRSQJP9ndYgp10z8qwlhTp3To0oOlkMKjzYNfMhit4/xNrusiD7yBJPtYf90ErPVnGmQhbeleSeAaoW26+5r+xJZPVzcESM1pt7dhqWMo6bCuwc7blPO0QiEwii2UBVWqFB7oHJEnQTsJ9exvfxDsFirVARFXjzocK1c6txF0zJ+hLbPuzTkJ/9iS9YlUBmQNWEDIAUHEpFievem/28bcRIkrdFQEku1L3PDq7EEUK3jkLl7Qo3/ONkZ+hBjriZ5HrmtOzeel6n8Qcq4b2wepWX+FgfpjP18c9peS9Dk2nvJ1tDmZifNrHreH6O+mvQDOxRp51B835Mn8L+/4NSww4tQbP0Q== devops
ssh/authorized_keys

echo "Getting dotfiles..."
hash curl >/dev/null 2>&1 && env curl https://raw.githubusercontent.com/nbari/dotfiles/master/my-dotfiles.sh | sh || {
  echo "curl not installed"
  exit
}

echo "Cloning vim Vundle..."
hash git >/dev/null 2>&1 && env git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim || {
  echo "git not installed"
  exit
}

echo "Installing node packages..."
hash npm >/dev/null 2>&1 && env npm install js-beautify js-yaml jsonlint less jslint node-sass || {
  echo "npm not installed"
}

echo "Installing pip packages..."
hash pip >/dev/null 2>&1 && env pip install --user --upgrade autopep8 pyflakes pylint cryptography || {
  echo "pip not installed"
}

echo "Installing Vundle plugins run: vim +PluginInstall +qall"
vim +PluginInstall +qall

echo "To change your default shell to zsh:  chsh -s `which zsh`"

echo "Fin"
