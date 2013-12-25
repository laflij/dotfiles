# dotfiles

These are the dotfiles I use to personalize my working environment. The 
dotfiles are categorized inside the apps folder according to the following 
directory structure:

```
.
├── README.md
├── apps
│   ├── bash
│   │   ├── aliases.link
│   │   ├── bash_profile.link
│   │   ├── functions.link
│   │   └── prompt.link
│   ├── emacs
│   │   ├── emacs.d.link
│   │   └── emacs.link
│   ├── git
│   │   ├── gitconfig.link
│   │   └── gitignore_global.link
│   └── hg
│       ├── hgignore_global.link
│       └── hgrc.link
├── brew_install
├── brew_uninstall
├── install.sh
├── rvm_install
├── uninstall.sh
└── update.sh
```

## Install

The install.sh script will copy the files and directories with a .linkhome 
extension to appropriate files to your home directory.

```
git clone https://github.com/vasudevanv/dotfiles.git ~/dotfiles
cd ~/dotfiles
sh install.sh 
```

## Thanks
I really liked the idea of organizing and maintaining dotfiles in a 
git repository when I came across this blog post from Zach Holman
(http://zachholman.com/2010/08/dotfiles-are-meant-to-be-forked/) 


