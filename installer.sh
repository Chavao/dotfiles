#!/bin/sh

export INSTALLER_PATH=$(echo $0 | sed 's/installer\.sh//g')

function confirm_overwrite() {
    if [ -f $HOME/.$1 ]
    then
        printf "Overwrite ~/.$1? [y/N]: "
        read INSTALLER_OVERWRITE

        if [ ! -z $INSTALLER_OVERWRITE ]
        then
            if [ $INSTALLER_OVERWRITE == 'y' ]
            then
                $2
            fi
        fi
    else
        $2
    fi
}

function install_git_config() {
    printf "Installing gitconfig file...\n"
    printf "E-mail: "
    read INSTALLER_GIT_EMAIL

    confirm_overwrite gitconfig copy_git_config
}

function copy_git_config() {
    cat $(echo $INSTALLER_PATH)templates/gitconfig | 
    sed s/{{EMAIL}}/$INSTALLER_GIT_EMAIL/g > $HOME/.gitconfig
}

function install_tmux_plugin_manager() {
    git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
}

function install_tmux_config() {
    confirm_overwrite tmux.conf copy_tmux_config
}

function copy_tmux_config() {
    cat $(echo $INSTALLER_PATH)templates/tmux.conf > $HOME/.tmux.conf
}

function install_vimfiles() {
    curl -k https://raw.githubusercontent.com/Chavao/vimfiles/master/install.sh | sh
}

function install_diff_so_fancy() {
    sudo npm install -g diff-so-fancy
}

function install_dotfiles() {
    install_git_config
    install_tmux_plugin_manager
    install_tmux_config
    install_vimfiles
    install_diff_so_fancy
}

install_dotfiles
