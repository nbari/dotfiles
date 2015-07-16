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

echo "Getting dotfiles..."
hash curl >/dev/null 2>&1 && env curl https://raw.githubusercontent.com/nbari/dotfiles/master/my-dotfiles.sh | sh || {
  echo "curl not installed"
  exit
}

echo "Cloning vim Vundle"
hash git >/dev/null 2>&1 && env git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim || {
  echo "git not installed"
  exit
}

echo "Installing node packages"
hash npm >/dev/null 2>&1 && env npm install js-beautify js-yaml jsonlint less jslint || {
  echo "npm not installed"
}

echo "Installing Vundle plugins run: vim +PluginInstall +qall"
vim +PluginInstall +qall

echo "To change your default shell to zsh:  chsh -s `which zsh`"

echo "Fin"
