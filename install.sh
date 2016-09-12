#!/bin/bash -x

PACKAGES_LIST="
build-essential
curl
vim
git
nginx
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

    # Install packages
    sudo apt-get update
    sudo apt-get install -y $PACKAGES
fi

sudo service nginx restart
