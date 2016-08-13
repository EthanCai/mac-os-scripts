#!/bin/bash

# Use unofficial Bash Strict Mode
set -euo pipefail
IFS=$'\n\t'

# LOG
NC='\033[0m' # No Color
RED='\033[0;31m'
YELLOW='\033[0;33m'
GREEN='\033[0;32m'

function error() {
    typeset message
    message=$1

    printf "${RED}[ERROR]${NC} - $message\n"
}

function warning() {
    typeset message
    message=$1

    printf "${YELLOW}[WARNING]${NC} - $message\n"
}

function info() {
    typeset message
    message=$1

    printf "${GREEN}[INFO]${NC} - $message\n"
}

# Homebrew install
function brewInstall() {
    typeset appName
    appName=$1

    if ! brew list $appName 1> /dev/null 2> /dev/null
    then
        info "start install $appName "
        brew install $appName
    else
        info "$appName is already installed"
    fi
    return 0
}

# Register config in shell startup script
function registerInZshrc() {
    typeset filePath
    typeset comments
    filePath=$1
    comments=$2

    if [ ! -e  $filePath ]
    then
        warning "$filePath not exists"
        return 0
    fi

    if grep -p "$filePath" ~/.zshrc 1> /dev/null
    then
        warning "$filePath is already registered"
        return 0
    fi

    info "start register $filePath"
    echo "" >> ~/.zshrc
    echo "# $comments" >> ~/.zshrc
    echo "source $filePath" >> ~/.zshrc
    return 0
}
