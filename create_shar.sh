#!/bin/sh

git pull

rm my-dotfiles.sh

cd my-dotfiles

rm -f .vim/.netrwhist

shar `find . -not -path "./.vim/bundle*" -not -path "./.vim/plugged*" -print` > ../my-dotfiles.sh

git add -A
git commit -m "update `date`"
