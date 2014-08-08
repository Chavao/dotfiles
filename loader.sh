#!/bin/sh

if [[ $(ps -p $$ -ocomm=) == "bash" ]]; then source ~/dotfiles/bashrc
else source ~/dotfiles/zshrc
fi
