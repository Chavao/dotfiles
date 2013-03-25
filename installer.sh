#!/bin/bash

export INSTALLER_PATH=$(echo $0 | sed 's/installer\.sh//g')

function install_git_config() {
	printf "Installing gitconfig file...\n"
	printf "Real name: "
	read INSTALLER_GIT_REAL_NAME
	printf "E-mail: "
	read INSTALLER_GIT_EMAIL

	if [ -f $HOME/.gitconfig ]
	then
		printf "Overwrite ~/.gitconfig? [y/N]: "
		read INSTALLER_GIT_OVERWRITE

		if [ ! -z $INSTALLER_GIT_OVERWRITE ]
		then
			if [ $INSTALLER_GIT_OVERWRITE == 'y' ]
			then
				copy_git_config
			fi
		fi
	else
		copy_git_config
	fi
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

	if [ -f $HOME/.hgrc ]
	then
		printf "Overwrite ~/.hgrc? [y/N]: "
		read INSTALLER_HG_OVERWRITE

		if [ ! -z $INSTALLER_HG_OVERWRITE ]
		then
			if [ $INSTALLER_HG_OVERWRITE == 'y' ]
			then
				copy_hg_config
			fi
		fi
	else
		copy_hg_config
	fi
}

function copy_hg_config() {
	cat $(echo $INSTALLER_PATH)templates/hgrc | 
	sed s/{{USERNAME}}/$INSTALLER_HG_REAL_NAME/g | 
	sed s/{{EMAIL}}/$INSTALLER_HG_EMAIL/g > $HOME/.hgrc
}

function install_screen_config() {
	if [ -f $HOME/.screenrc ]
	then
		printf "Overwrite ~/.screenrc? [y/N]: "
		read INSTALLER_SCREEN_OVERWRITE

		if [ ! -z $INSTALLER_SCREEN_OVERWRITE ]
		then
			if [ $INSTALLER_SCREEN_OVERWRITE == 'y' ]
			then
				copy_screen_config
			fi
		fi
	else
		copy_screen_config
	fi
}

function copy_screen_config() {
	cat $(echo $INSTALLER_PATH)templates/screenrc > $HOME/.screenrc
}

function install_vimfiles() {
	# TODO: Instalation via Git
	echo;
}

function install_dotfiles() {
	install_git_config
	install_hg_config
	install_screen_config
	install_vimfiles
}

install_dotfiles