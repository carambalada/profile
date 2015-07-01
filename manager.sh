#!/bin/sh

BASEDIR=$( cd "$( dirname "$0" )" && pwd )

_yesno ()
	{
    read -p "$1? [Y/n]" yn
    case $yn in
        [Nn]* ) return 1;;
        * ) return 0;;
    esac
	}

_mklink ()
	{
	if [ -f $2 ]; then 
		if ! ( _yesno "Replace file $2" ); then 
			echo "File $2 is skipped."
			return
		fi
	fi
	echo "Creating $2"
	LINKDIR=$( dirname "$2" )
	if ! [ -d $LINKDIR ]; then
		mkdir -p $LINKDIR
	fi
	ln -sf $1 $2
	}

# VIM
_mklink ${BASEDIR}/vim/.vimrc ~/.vimrc

# FONTS
sed s/main$/"main contrib non-free"/ -i.bak /etc/apt/sources.list
apt-get -i ttf-mscorefonts-installer xfonts-terminus
_mklink ${BASEDIR}/font/fonts.conf ~/.config/fontconfig/fonts.conf

# ZSH
