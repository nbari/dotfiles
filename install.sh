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

# Create Screenshots directory if it doesn't exist
if [ ! -d ~/Screenshots ]; then
    echo "making Screenshots directory"
    mkdir ~/Screenshots
fi

cd "$HOME"

# create Bundle file
cat <<EOF >"$HOME"/.Brewfile
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
brew "node"
brew "pnpm"
brew "ripgrep"
brew "rsync"
brew "sipcalc"
brew "ssh-vault"
brew "tig"
brew "tmux"
brew "tree"
brew "wget"
brew "zinit"
brew "wireshark"
cask "alacritty"
cask "clipy"
cask "font-monoid-nerd-font"
cask "karabiner-elements"
EOF

brew bundle --file="$HOME"/.Brewfile

if [ ! -d ~/projects ]; then
    echo "making projects directory"
    mkdir ~/projects
fi

# Create .config directory if it doesn't exist
if [ ! -d ~/.config ]; then
    echo "making .config directory"
    mkdir ~/.config
fi

# Create .config/karibiner directory if it doesn't exist
if [ ! -d ~/.config/karabiner ]; then
    echo "making .config/karabiner directory"
    mkdir ~/.config/karabiner

    # Download Karabiner config
    curl -o ~/.config/karabiner/karabiner.json -fsSL https://raw.githubusercontent.com/nbari/dotfiles/refs/heads/master/karabiner/karabiner.json

    # create .config/karibiner/assets directory if it doesn't exist
    echo "making .config/karabiner/assets directory"
    mkdir -p ~/.config/karabiner/assets/complex_modifications

    # Download Karabiner assets
    curl -o ~/.config/karabiner/assets/complex_modifications/ctrl-esc.json -fsSL https://raw.githubusercontent.com/nbari/dotfiles/refs/heads/master/karabiner/assets/complex_modifications/ctrl-esc.json
    curl -o ~/.config/karabiner/assets/complex_modifications/vim.json -fsSL https://raw.githubusercontent.com/nbari/dotfiles/refs/heads/master/karabiner/assets/complex_modifications/vim.json
fi

# Create .config/alacritty directory if it doesn't exist
if [ ! -d ~/.config/alacritty ]; then
    echo "making .config/alacritty directory"
    mkdir ~/.config/alacritty

    # Download Alacritty config
    curl -o ~/.config/alacritty/alacritty.toml -fsSL https://raw.githubusercontent.com/nbari/dotfiles/refs/heads/master/alacritty/alacritty.toml
fi

# Create .tmux.conf if it doesn't exist
curl -o ~/.tmux.conf -fsSL https://raw.githubusercontent.com/nbari/dotfiles/refs/heads/master/my-dotfiles/.tmux.conf || {
    echo "Failed to download .tmux.conf"
    exit 1
}

# Create .zshrc if it doesn't exist
if [ ! -f ~/.zshrc ]; then
    echo "making .zshrc file"
    curl -o ~/.zshrc -fsSL https://raw.githubusercontent.com/nbari/dotfiles/refs/heads/master/my-dotfiles/.zshrc || {
        echo "Failed to download .zshrc"
        exit 1
    }
    zinit
fi

echo "Fin"
