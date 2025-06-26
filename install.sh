set -euo pipefail

echo "[BOOTSTRAP] Starting macOS setup..."

# Ensure required tools exist
command -v git >/dev/null 2>&1 || {
    echo "[ERROR] git not installed"
    exit 1
}

# Install Homebrew if not already present
if ! command -v brew >/dev/null 2>&1; then
    echo "[INFO] Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >>"$HOME/.zprofile"
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    echo "[INFO] Homebrew already installed"
fi

brew update

# Set screenshot directory
mkdir -p "$HOME/Screenshots"
defaults write com.apple.screencapture location "$HOME/Screenshots"
echo "[INFO] Screenshot location set to $HOME/Screenshots"

# Define Brewfile contents
BREWFILE="$HOME/.Brewfile"
cat <<EOF >"$BREWFILE"
brew "autossh"
brew "curl"
brew "direnv"
brew "fd"
brew "fzf"
brew "gh"
brew "gnupg"
brew "ipcalc"
brew "jq"
brew "lz4"
brew "ncdu"
brew "neovim"
brew "node"
brew "openssl"
brew "par"
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
cask "1password-cli"
cask "alacritty"
cask "clipy"
cask "font-monoid-nerd-font"
cask "karabiner-elements"
cask "menumeters"
cask "utm"
EOF

echo "[INFO] Installing Brewfile packages..."
brew bundle --file="$BREWFILE"

# Create common directories
mkdir -p "$HOME/projects"
mkdir -p "$HOME/.config"

# Configure Karabiner
KARABINER_DIR="$HOME/.config/karabiner"
if [ ! -f "$KARABINER_DIR/karabiner.json" ]; then
    echo "[INFO] Setting up Karabiner config..."
    mkdir -p "$KARABINER_DIR/assets/complex_modifications"
    curl -fsSL -o "$KARABINER_DIR/karabiner.json" \
        https://raw.githubusercontent.com/nbari/dotfiles/refs/heads/master/karabiner/karabiner.json
    curl -fsSL -o "$KARABINER_DIR/assets/complex_modifications/ctrl-esc.json" \
        https://raw.githubusercontent.com/nbari/dotfiles/refs/heads/master/karabiner/assets/complex_modifications/ctrl-esc.json
    curl -fsSL -o "$KARABINER_DIR/assets/complex_modifications/vim.json" \
        https://raw.githubusercontent.com/nbari/dotfiles/refs/heads/master/karabiner/assets/complex_modifications/vim.json
else
    echo "[INFO] Karabiner config already present"
fi

# Configure Alacritty
ALACRITTY_DIR="$HOME/.config/alacritty"
if [ ! -f "$ALACRITTY_DIR/alacritty.toml" ]; then
    echo "[INFO] Setting up Alacritty config..."
    mkdir -p "$ALACRITTY_DIR"
    curl -fsSL -o "$ALACRITTY_DIR/alacritty.toml" \
        https://raw.githubusercontent.com/nbari/dotfiles/refs/heads/master/alacritty/alacritty.toml
fi

# Download .tmux.conf
echo "[INFO] Downloading .tmux.conf..."
curl -fsSL -o "$HOME/.tmux.conf" \
    https://raw.githubusercontent.com/nbari/dotfiles/refs/heads/master/my-dotfiles/.tmux.conf

# Setup .zshrc
if [ ! -f "$HOME/.zshrc" ]; then
    echo "[INFO] Downloading .zshrc..."
    curl -fsSL -o "$HOME/.zshrc" \
        https://raw.githubusercontent.com/nbari/dotfiles/refs/heads/master/my-dotfiles/.zshrc
    zinit update || echo "[WARN] Failed to run zinit update"
fi

# Install Rust (if not present)
if ! command -v rustc >/dev/null 2>&1; then
    echo "[INFO] Installing Rust..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    source "$HOME/.cargo/env"
else
    echo "[INFO] Rust already installed: $(rustc --version)"
fi

# Install `slick` Rust binary
if ! command -v slick >/dev/null 2>&1; then
    echo "[INFO] Installing slick..."
    cargo install slick
else
    echo "[INFO] Slick already installed: $(slick --version)"
fi

# Install a default Python version with pyenv if not installed yet
DEFAULT_PYTHON_VERSION="3.13"
if command -v pyenv >/dev/null 2>&1; then
    if ! pyenv versions --bare | grep -q "^${DEFAULT_PYTHON_VERSION}$"; then
        echo "[INFO] Installing Python $DEFAULT_PYTHON_VERSION with pyenv..."
        pyenv install "$DEFAULT_PYTHON_VERSION"
        pyenv global "$DEFAULT_PYTHON_VERSION"
    else
        echo "[INFO] Python $DEFAULT_PYTHON_VERSION already installed via pyenv"
    fi
fi

echo "[DONE] macOS setup completed successfully 🎉"
