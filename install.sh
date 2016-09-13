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

    # Node Installation
    export NVM_DIR="/home/vagrant/.nvm" && (
        git clone https://github.com/creationix/nvm.git "$NVM_DIR"
        cd "$NVM_DIR"
        git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" origin`
    ) && . "$NVM_DIR/nvm.sh"

    nvm install v4.5.0
    nvm ls
    npm install -g npm nodemon

fi

sudo service nginx restart
sudo service mongod restart
