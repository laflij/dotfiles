# dotfiles

These are the dotfiles I use to personalize my working environment. The 
dotfiles are categorized inside the apps folder according to the following 
directory structure:

```
.
├── README.md
├── brew_install
├── rvm_install
├── dotfiles
│   ├── install.sh
│   ├── uninstall.sh
│   ├── update.sh
│   ├── bash
│   │   ├── bash_profile.link
│   │   └── screenrc.link
│   ├── git
│   │   ├── git-prompt.link
│   │   ├── gitconfig.link
│   │   ├── gitconfig.template
│   │   └── gitignore_global.link
│   ├── python
│   │   └── matplotlib
│   │       └── matplotlibrc
│   └── vim
│       └── vimrc.link
└── osx-terminal.app-colors-solarized
    ├── README.md
    ├── Solarized\ Dark.terminal
    └── Solarized\ Light.terminal
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


