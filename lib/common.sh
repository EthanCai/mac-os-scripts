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

    # check whether Homebrew is installed
    if ! hash brew 2>/dev/null
    then
        echo "Homebrew isn't installed. Please install it first."
        return 1
    fi

    if ! brew list $appName 1> /dev/null 2> /dev/null
    then
        info "start install $appName "
        brew install $appName
    else
        info "$appName is already installed"
    fi
    return 0
}

# Homebrew upgrade
function brewUpgrade() {
    typeset appName
    appName=$1

    # check whether Homebrew is installed
    if ! hash brew 2>/dev/null
    then
        echo "Homebrew isn't installed. Please install it first."
        return 1
    fi

    if brew list $appName 1> /dev/null 2> /dev/null
    then
        info "start upgrade $appName, make sure execute \"brew update\" first"
        echo $(brew upgrade $appName)
    else
        warning "$appName is not installed"
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

# create directory
function createDir() {
    typeset dirPath
    dirPath=$1

    if [ ! -d $dirPath ]
    then
        info "create folder \"$dirPath\""
        mkdir -p "$dirPath"
    else
        warning "folder \"$dirPath\" already exists"
    fi
}


# install golang.org/x/pkg
function installGoXPkg() {
    typeset pkgName
    typeset pkgURL
    pkgName=$1
    pkgURL=$2

    pkgPath="$GOPATH/src/$pkgName"
    createDir "$(dirname "$pkgPath")" # create parent directory of pkgPath

    if [ -d "$pkgPath" ]
    then
        info "update $pkgName"
        pushd "$pkgPath" 1 > /dev/null
        git pull
        popd 1 > /dev/null
    else
        info "download $pkgName"
        git clone "$pkgURL" "$pkgPath" 2> /dev/null || info "$pkgName is already installed"
    fi
}
