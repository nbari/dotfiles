set -euo pipefail

# Install Homebrew
hash brew 2 >/dev/null &
1 || {
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo >>"$HOME"/.zprofile
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >>"$HOME"/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
}

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
