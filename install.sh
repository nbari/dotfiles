set -e

cd $HOME

if [ ! -n "$ZSH" ]; then
    ZSH=~/.zsh
fi

if [ -d "$ZSH" ]; then
  echo "\033[0;33mYou already have an .zsh dir.\033[0m You'll need to remove $ZSH if you want to install"
  exit
fi

echo "\033[0;34mLooking for an existing zsh config...\033[0m"
if [ -f ~/.zshrc ] || [ -h ~/.zshrc ]; then
  echo "\033[0;33mFound ~/.zshrc.\033[0m \033[0;32mBacking up to ~/.zshrc.bak\033[0m";
  mv ~/.zshrc ~/.zshrc.bak;
fi

echo "\033[0;34mLooking for an existing csh config...\033[0m"
if [ -f ~/.cshrc ] || [ -h ~/.cshrc ]; then
  echo "\033[0;33mFound ~/.cshrc.\033[0m \033[0;32mBacking up to ~/.cshrc.bak\033[0m";
  mv ~/.cshrc ~/.cshrc.bak;
fi

echo "\033[0;34mGetting my dotfiles...\033[0m"
hash curl >/dev/null 2>&1 && env curl https://raw.githubusercontent.com/nbari/dotfiles/develop/my-dotfiles.sh | sh || {
  echo "curl not installed"
  exit
}

echo "\033[0;32mTo change your default shell to zsh: \033[0m chsh -s `which zsh`"

echo "\033[0;33mCloning vim Vundle\033[0m"
hash git >/dev/null 2>&1 && env git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim || {
  echo "git not installed"
  exit
}

echo "\033[0;33mInstalling Vundle plugins\033[0m"
vim +PluginInstall +qall
