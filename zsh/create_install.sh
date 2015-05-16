#!/bin/sh

cd my-zsh

shar `find . -print` > ../install.sh
