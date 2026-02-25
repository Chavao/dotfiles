#!/bin/sh
_UNAME_SYSTEM_TYPE="$(uname -s)"
case "${_UNAME_SYSTEM_TYPE}" in
    Linux*)
        # sudo localedef -i pt_BR -f UTF-8 pt_BR.UTF-8
        export LC_ALL="pt_BR.utf8"
        export LANG=$LC_ALL
        ;;
    Darwin*)
        export LC_ALL="pt_BR.UTF-8"
        export LC_CTYPE="UTF-8"
        export LANG=$LC_ALL
        ;;
esac

for i in $HOME/dotfiles/{functions,aliases}/*.sh; do source $i; done

export VISUAL="nvim"
export EDITOR="nvim"
export PATH="$PATH:$HOME/dotfiles/bin"
