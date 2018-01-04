#!/bin/bash -x

PACKAGES_LIST="
build-essential
curl
vim
git
nginx
mongodb-org
"

PACKAGES=""
for package in $PACKAGES_LIST
do
    PACKAGES="$PACKAGES $package"
done

IS_INSTALLED=".installed"

if [ ! -e $IS_INSTALLED ];then
    touch $IS_INSTALLED

    echo "Package Installation Initiated..."

    # MongoDB Required Settings
    sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
    echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list

    # Install Packages
    sudo apt-get update
    sudo apt-get install -y $PACKAGES

    # Fix No User Set Locale For Mongo Client
    sudo locale-gen


    # Install NVM
    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash

    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

    # Install Node LTS
    nvm install --lts
    nvm ls
fi

sudo service nginx restart
sudo service mongod restart
