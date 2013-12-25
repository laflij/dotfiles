#!/bin/bash

# Removes all the links created by install.sh in the user's homefolder

DIR=`pwd`

# Shell colors
red='\e[0;31m'
green='\e[0;32m'
blue='\e[0;34m'
NC='\e[0m'

# Define functions to print information in colorful
info () 
{
    printf "[${blue} Info ${NC}] $1 "
}

success () 
{
    printf "[${green} Success ${NC}] $1"
}

fail () 
{
    printf "[${red} Fail ${NC}] $1"
    echo ''
    exit
}

unlink_dotfiles () 
{
    info 'Unlinking dotfiles from the home directory'
    for source in `find $DIR -maxdepth 2 -name \*.link`
    do
	dest="$HOME/.`basename \"${source%.*}\"`"
	if [ -f $dest -o -d $dest ]
	then
	    success "Removing $dest"
	    rm -rf $dest
	fi
    done
}

# Run functions
set -e
unlink_dotfiles

