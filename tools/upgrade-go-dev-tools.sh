#!/bin/bash

# Homebrew is required before executing this script

# Use unofficial Bash Strict Mode
set -euo pipefail
IFS=$'\n\t'

# import common.sh
CUR_DIR=$(cd $(dirname $0) && pwd)
source $CUR_DIR/../lib/common.sh

# 更新Go语言开发相关工具, 执行前请确认已翻墙
brew update && brewUpgrade glide
go get -v -u golang.org/x/tools/cmd/...
go get -v -u github.com/alecthomas/gometalinter
go get -v -u github.com/nsf/gocode
go get -v -u sourcegraph.com/sqs/goreturns
go get -v -u github.com/rogpeppe/godef
