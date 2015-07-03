#!/bin/sh

rm my-dotfiles.sh

cd my-dotfiles

rm -f .vim/.netrwhist

shar `find . -not -path "./.vim/bundle*" -print` > ../my-dotfiles.sh
