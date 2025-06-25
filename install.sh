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

cd "$HOME"

# create Bundle file
cat <<EOF >"$HOME"/.Brewfile
brew "alacritty"
brew "clippy"
brew "curl"
brew "direnv"
brew "fd"
brew "fzf"
brew "gh"
brew "gnupg"
brew "ipcalc"
brew "jq"
brew "lz4"
brew "neovim"
brew "ripgrep"
brew "rsycn"
brew "sipcal"
brew "ssh-vault"
brew "tig"
brew "tmux"
brew "tree"
brew "wget"
brew "zinit"
brew "wireshark"
cask "font-monoid"
cask "karabiner-elements"
EOF

brew bundle --file="$HOME"/.Brewfile

if [ ! -d ~/projects ]; then
    echo "making projects directory"
    mkdir ~/projects
fi

echo ""
echo "After loading the shell (zsh, go path, etc) do this: vim +PlugInstall +qall"
echo ""
echo "Fin"
