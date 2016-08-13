#!/bin/bash

# Homebrew is required before executing this script

# Use unofficial Bash Strict Mode
set -euo pipefail
IFS=$'\n\t'

# import common.sh
CUR_DIR=$(cd $(dirname $0) && pwd)
source $CUR_DIR/../lib/common.sh

# install nvm
brewInstall nvm

# create nvm home folder
export NVM_DIR=~/.nvm
if [ ! -d $NVM_DIR ]
then
    info "start create folder $NVM_DIR"
    mkdir $NVM_DIR
fi

# register nvm startup script
CUR_DIR=$(cd $(dirname $0) && pwd)
CONFIG_FILE="$CUR_DIR/../config/nvm-config.sh"

registerInZshrc "$CONFIG_FILE" "register nvm config script"
