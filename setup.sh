set -e

brew update

brew install ag && \
brew install autossh && \
brew install direnv && \
brew install python && \
brew install vim --with-override-system-vi && \
brew install git --without-completions && \
brew install npm && \
brew install ripgrep && \
brew install ssh-vault && \
brew install tmux && \
brew install tree && \
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
