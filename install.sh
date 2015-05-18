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
  echo "\033[0;33mFound ~/.zshrc.\033[0m \033[0;32mBacking up to ~/.zshrc.old\033[0m";
  mv ~/.zshrc ~/.zshrc.old;
fi

echoo "\033[0;34mGetting my dotfiles...\033[0m"
hash curl >/dev/null 2>&1 && env curl https://raw.githubusercontent.com/nbari/dotfiles/develop/install.sh | sh || {
  echo "curl not installed"
  exit
}

echo "\033[0;32mTo change your default shell to zsh: \033[0m chsh -s `which zsh`"
