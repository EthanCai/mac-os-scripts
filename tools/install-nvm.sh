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
createDir $NVM_DIR

# register nvm startup script
CUR_DIR=$(cd $(dirname $0) && pwd)
CONFIG_FILE="$CUR_DIR/../config/nvm-init.sh"

registerInZshrc "$CONFIG_FILE" "register nvm config script"
