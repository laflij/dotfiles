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


# Link dotfiles
link_files () 
{
    info "Linking $1 to $2"
    if [ -f $2 -o -d $2 ]
    then
        info "$2 exists. Replacing old version of $2 with new one"
        rm -rf $2
        ln -s $1 $2
	success "Linked $1 to $2"
    else
        ln -s $1 $2
	success "Linked $1 to $2"
    fi
}

copy_files () 
{
    info "Copying $1 to $2"
    if [ -f $2 -o -d $2 ]
    then
        info "$2 exists. Replacing old version of $2 with new one"
        rm -rf $2
        cp -r $1 $2
	success "Copied $1 to $2"
    else
        cp -r $1 $2
	success "Copied $1 to $2"
    fi
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

# Copy git-prompt.sh (for git version control information in prompt)
source="$HOME/Software/system-config/dotfiles/git/git-prompt.sh"
dest="$HOME/.git-prompt.sh"
copy_files $source $dest

# Copy tex.vim (for vim-latex modifications)
source="$HOME/Software/system-config/dotfiles/vim-latex/tex.vim"
dest="$HOME/.vim/bundle/vim-latex/ftplugin/tex.vim"
link_files $source $dest

# Link dotfiles functions
symlink_dotfiles

# Delete osx vimrc
rm -rf ~/.vimrc*
# link ubuntu vimrc correctly
ln -s ~/Software/system-config/dotfiles/vim/vimrc-ubuntu.link ~/.vimrc

# Delete ~/.bash_profile (osx)
rm -rf ~/.bash_profile

# Delete osx gitconfig
rm -rf ~/.gitconfig
rm -rf ~/.gitconfig-ubuntu
# link ubuntu vimrc correctly
ln -s ~/Software/system-config/dotfiles/git/gitconfig-ubuntu.link ~/.gitconfig

# Source .bashrc
source $HOME/.bashrc
