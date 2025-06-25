set -euo pipefail

hash git >/dev/null 2>&1 || {
    echo "git not installed"
    exit 1

}

# Install Homebrew
hash brew >/dev/null 2>&1 || {
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo >>"$HOME"/.zprofile
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >>"$HOME"/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
}

brew update

defaults write com.apple.screencapture location ~/Screenshots

brew install \
    alacritty \
    neovim \
    ripgrep \
    fd \
    fzf \
    tree \
    wget \
    curl \
    jq \
    tmux \
    zhinit \
    --cask font-monoid

cd "$HOME"

if [ ! -d ~/projects ]; then
    echo "making projects directory"
    mkdir ~/projects
fi

echo ""
echo "After loading the shell (zsh, go path, etc) do this: vim +PlugInstall +qall"
echo ""
echo "Fin"
