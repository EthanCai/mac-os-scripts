#!/bin/bash

# Use unofficial Bash Strict Mode
set -euo pipefail
IFS=$'\n\t'

# import common.sh
CUR_DIR=$(cd $(dirname $0) && pwd)
source $CUR_DIR/../lib/common.sh

# this funciton is used to install golang.org/x/pkg
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

# install golang.org/x package
installGoXPkg "golang.org/x/sys" "https://github.com/golang/sys.git"
installGoXPkg "golang.org/x/net" "https://github.com/golang/net.git"
installGoXPkg "golang.org/x/text" "https://github.com/golang/text.git"
installGoXPkg "golang.org/x/crypto" "https://github.com/golang/crypto.git"
