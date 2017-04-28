#!/bin/bash

export NVM_DIR=~/.nvm
# 使用国内镜像安装node
export NVM_NODEJS_ORG_MIRROR=http://npm.taobao.org/mirrors/node
. $(brew --prefix nvm)/nvm.sh
