#!/bin/bash

npm install -g cnpm --registry=https://registry.npm.taobao.org
cnpm install -g bower
cnpm install -g webpack
cnpm install -g http-server
cnpm install -g node-uuid
cnpm install -g hexo-cli
cnpm install -g gulp
cnpm install -g gulp-cli
cnpm install -g yo
cnpm install -g hexo-cli

echo "installed npm packages"
cnpm list -g --depth=0
