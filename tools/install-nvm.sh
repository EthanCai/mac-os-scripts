#!/bin/bash

# Homebrew is required before executing this script

# Use unofficial Bash Strict Mode
set -euo pipefail
IFS=$'\n\t'

export NVM_DIR=~/.nvm

# install nvm
if ! brew list nvm 1> /dev/null 2> /dev/null
then
    brew install nvm
fi

# create nvm home folder
if [ ! -d $NVM_DIR ]
then
    mkdir $NVM_DIR
fi

# register nvm startup script
CUR_DIR=$(cd $(dirname $0) && pwd)
if [ -e $CUR_DIR/../config/nvm-config.sh ] && ! grep -p "nvm-config.sh" ~/.zshrc
then
    echo "" >> ~/.zshrc
    echo "# register nvm startup script into .zshrc" >> ~/.zshrc
    echo "source $CUR_DIR/../config/nvm-config.sh" >> ~/.zshrc
fi
