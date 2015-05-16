#!/bin/sh

cd my-dotfiles

shar `find . -print` > ../install.sh
