#!/bin/bash

# Use unofficial Bash Strict Mode
set -euo pipefail
IFS=$'\n\t'

# import common.sh
CUR_DIR=$(cd $(dirname $0) && pwd)
source $CUR_DIR/../lib/common.sh

# install golang.org/x package
installGoXPkg "golang.org/x/sys" "https://github.com/golang/sys.git"
installGoXPkg "golang.org/x/net" "https://github.com/golang/net.git"
installGoXPkg "golang.org/x/text" "https://github.com/golang/text.git"
installGoXPkg "golang.org/x/crypto" "https://github.com/golang/crypto.git"
installGoXPkg "golang.org/x/tools" "https://github.com/golang/tools.git"
