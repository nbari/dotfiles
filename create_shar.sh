#!/bin/sh

rm my-dotfiles.sh

cd my-dotfiles

shar `find . -not -path "./.vim/bundle*" -print` > ../my-dotfiles.sh
