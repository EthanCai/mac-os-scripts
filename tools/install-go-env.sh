#!/bin/bash

# Homebrew is required before executing this script

# Use unofficial Bash Strict Mode
set -euo pipefail
IFS=$'\n\t'

# import common.sh
CUR_DIR=$(cd $(dirname $0) && pwd)
source $CUR_DIR/../lib/common.sh

# install go
brewInstall go

# install glide
brewInstall glide

# set GOPATH and PATH
CUR_DIR=$(cd $(dirname $0) && pwd)
CONFIG_FILE="$CUR_DIR/../config/go-config.sh"

registerInZshrc "$CONFIG_FILE" "register golang config"
