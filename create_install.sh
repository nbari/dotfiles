#!/bin/sh

cd my-dotfiles

shar `find . -not -path "./.vim/bundle*" -print` > ../install.sh
