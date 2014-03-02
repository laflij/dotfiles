#!/bin/bash

# Script to install some basic applications

# Get current directory path
DIR="`pwd`"

# Shell colors
red='\e[0;31m'
green='\e[0;32m'
yellow='\e[0;33m'
blue='\e[0;34m'
NC='\e[0m'

# Define functions to print information in colorful
info () 
{
    printf "[${blue} Info ${NC}] $1 \n"
}

query () 
{
    printf "[${yellow} Info ${NC}] $1  "
}


success () 
{
    printf "[${green} Success ${NC}] $1 \n"
}

fail () 
{
    printf "[${red} Fail ${NC}] $1 \n"
    echo ''
    exit
}

# Check for Xcode installation
if [ ! -d /Applications/Xcode.app ]; then
    fail "Need Xcode to be installed before running this script"
fi

# Link dotfiles
link_files () 
{
    ln -s $1 $2
    success "Linked $1 to $2"
}

copy_files () 
{
    cp -r $1 $2
    success "Copied $1 to $2"
}

symlink_dotfiles () 
{
    info 'Linking dotfiles to the home directory'
    for source in `find $DIR -maxdepth 2 -name \*.link`
    do
	dest="$HOME/.`basename \"${source%.*}\"`"
	if [ -f $dest -o -d $dest ]
	then
	    info "$dest exists. Replacing old version of $dest with new one"
	    rm -rf $dest
	    link_files $source $dest
	else
	    link_files $source $dest
	fi
    done
}

#copy_dotfiles () 
#{
#    info 'Copying dotfiles to the home directory'
#    for source in `find $DIR -maxdepth 2 -name \*.link`
#    do
#	dest="$HOME/.`basename \"${source%.*}\"`"
#	if [ -f $dest -o -d $dest ]
#	then
#	    info "$dest exists. Replacing old version of $dest with new one"
#	    rm -rf $dest
#	    copy_files $source $dest
#	else
#	    copy_files $source $dest
#	fi
#    done
#}

# Run functions
set -e
#copy_dotfiles
symlink_dotfiles
source $HOME/.bash_profile
