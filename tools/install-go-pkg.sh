#!/bin/bash

# Use unofficial Bash Strict Mode
set -euo pipefail
IFS=$'\n\t'

# import common.sh
CUR_DIR=$(cd $(dirname $0) && pwd)
source $CUR_DIR/../lib/common.sh

# install golang.org/x package
createDir "$GOPATH/src/golang.org/x"
git clone https://github.com/golang/sys.git "$GOPATH/src/golang.org/x/sys" 2> /dev/null || info "golang.org/x/sys is already installed" # install golang.org/x/sys
git clone https://github.com/golang/net.git "$GOPATH/src/golang.org/x/net" 2> /dev/null || info "golang.org/x/net is already installed" # install golang.org/x/net
