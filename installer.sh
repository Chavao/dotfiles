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
    printf "Real name: "
    read INSTALLER_GIT_REAL_NAME
    printf "E-mail: "
    read INSTALLER_GIT_EMAIL

    confirm_overwrite gitconfig copy_git_config
}

function copy_git_config() {
    cat $(echo $INSTALLER_PATH)templates/gitconfig | 
    sed s/{{USERNAME}}/$INSTALLER_GIT_REAL_NAME/g | 
    sed s/{{EMAIL}}/$INSTALLER_GIT_EMAIL/g > $HOME/.gitconfig
}

function install_hg_config() {
    printf "Installing hgrc file...\n"
    printf "Real name: "
    read INSTALLER_HG_REAL_NAME
    printf "E-mail: "
    read INSTALLER_HG_EMAIL

    confirm_overwrite hgrc copy_hg_config
}

function copy_hg_config() {
    cat $(echo $INSTALLER_PATH)templates/hgrc | 
    sed s/{{USERNAME}}/$INSTALLER_HG_REAL_NAME/g | 
    sed s/{{EMAIL}}/$INSTALLER_HG_EMAIL/g > $HOME/.hgrc
}

function install_screen_config() {
    confirm_overwrite screenrc copy_screen_config
}

function copy_screen_config() {
    cat $(echo $INSTALLER_PATH)templates/screenrc > $HOME/.screenrc
}

function install_vimfiles() {
    curl -k https://raw.githubusercontent.com/Chavao/vimfiles/master/install.sh | sh
}

function install_pedit() {
    git clone https://github.com/Chavao/pedit.git ~/.pedit
    sudo ln -s ~/.pedit/pedit.py /usr/bin/pedit
}

function install_dotfiles() {
    install_git_config
    install_hg_config
    install_screen_config
    install_vimfiles
    install_pedit
}

install_dotfiles
