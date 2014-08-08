#!/bin/sh

if [[ $(ps -p $$ | tail -n1) == *"bash"* ]]; then source ~/dotfiles/bashrc
else source ~/dotfiles/zshrc
fi
