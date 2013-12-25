#!/bin/bash

# Script to install some basic applications

# Get current directory path
DIR="`pwd`"
DPATH=$DIR/apps

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

# Configure git and mercurial
configure_version_control ()
{
    # Git
    info 'Configuring git and mercurial settings'
    query 'Enter your git user name : '
    read git_name
    query 'Enter your git email : '
    read git_email
    sed -e "s/XXNAME/${git_name}/g; s/XXEMAIL/${git_email}/g" \
	$DPATH/git/gitconfig.template > $DPATH/git/gitconfig.link
    success 'Configured git settings'
    
    # Mercurial
    query 'Enter your hg user name : '
    read hg_name
    query 'Enter your hg email : '
    read hg_email
    sed -e "s/XXNAME/${hg_name}/g; s/XXEMAIL/${hg_email}/g" \
	$DPATH/hg/hgrc.template > $DPATH/hg/hgrc.link
    success 'Configured mercurial settings'
}

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
    for source in `find $DPATH -maxdepth 1 -name \*.link`
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

copy_dotfiles () 
{
    info 'Copying dotfiles to the home directory'
    for source in `find $DPATH -maxdepth 2 -name \*.link`
    do
	dest="$HOME/.`basename \"${source%.*}\"`"
	if [ -f $dest -o -d $dest ]
	then
	    info "$dest exists. Replacing old version of $dest with new one"
	    rm -rf $dest
	    copy_files $source $dest
	else
	    copy_files $source $dest
	fi
    done
}

# Run functions
set -e
# configure_version_control
copy_dotfiles
source $HOME/.bash_profile










