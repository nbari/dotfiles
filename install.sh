set -euo pipefail

# Install Homebrew
which brew >/dev/null || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew update

cd "$HOME"

hash git >/dev/null 2>&1 || {
    echo "git not installed"
    exit 1
}

if [ ! -d ~/projects ]; then
    echo "making projects directory"
    mkdir ~/projects
fi

echo ""
echo "After loading the shell (zsh, go path, etc) do this: vim +PlugInstall +qall"
echo ""
echo "Fin"
