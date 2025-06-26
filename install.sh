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
brew "openssl"
brew "pnpm"
brew "pyenv"
brew "readline"
brew "ripgrep"
brew "rsync"
brew "sipcalc"
brew "sqlite3"
brew "ssh-vault"
brew "tcl-tk"
brew "tig"
brew "tmux"
brew "tree"
brew "wget"
brew "wireshark"
brew "xz"
brew "zinit"
brew "zlib"
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
    zinit update
fi

if ! command -v rustc >/dev/null 2>&1; then
    echo "[INFO] Rust is not installed. Installing..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    source "$HOME/.cargo/env"
    echo "[INFO] Rust installed successfully."
else
    echo "[INFO] Rust is already installed: $(rustc --version)"
fi

# Check is slick is installed
if ! command -v slick >/dev/null 2>&1; then
    echo "[INFO] Slick is not installed. Installing..."
    cargo install slick
    echo "[INFO] Slick installed successfully."
else
    echo "[INFO] Slick is already installed: $(slick --version)"
fi

echo "Fin"
