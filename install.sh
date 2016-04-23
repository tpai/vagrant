#!/bin/bash -x

PACKAGES_LIST="
build-essential
curl
vim
git
nginx
zsh
"

PACKAGES=""
for package in $PACKAGES_LIST
do
    PACKAGES="$PACKAGES $package"
done

IS_INSTALLED=".installed"

VIM_CONFIG="
\" Terminal Color
let g:solarized_termcolors = 256

set mouse=a                     \"Mouse Enabled
set clipboard=unnamed           \"Copy To System Clipboard

set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
"

if [ ! -e $IS_INSTALLED ];then
    touch $IS_INSTALLED

    echo "Package Installation Initiated..."

    # Install Packages
    sudo apt-get update
    sudo apt-get install -y $PACKAGES

    # Install NVM
    sh -c "`curl -fsSL https://raw.github.com/creationix/nvm/master/install.sh`"

    # This enables NVM without reopen terminal
    export NVM_DIR="/home/vagrant/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

    # Install Node and Set Alias
    nvm install v4.2.4
    nvm alias default v4.2.4
    nvm use v4.2.4
    npm install -g npm

    # Install on-my-zsh & change shell
    sh -c "`curl -fsSL http://cdn.rawgit.com/robbyrussell/oh-my-zsh/master/tools/install.sh`"
    sudo chsh -s /bin/zsh vagrant

    # Customize vim settings
    echo "$VIM_CONFIG" > "/home/vagrant/.vimrc"
fi

sudo service nginx restart
