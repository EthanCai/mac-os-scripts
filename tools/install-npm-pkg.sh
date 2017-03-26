#!/bin/bash

npm install -g cnpm --registry=https://registry.npm.taobao.org --save
cnpm install -g bower --save
cnpm install -g webpack --save
cnpm install -g http-server --save
cnpm install -g node-uuid --save
cnpm install -g hexo-cli --save
cnpm install -g gulp --save
cnpm install -g gulp-cli --save
cnpm install -g yo --save
cnpm install -g hexo-cli

echo "installed npm packages"
cnpm list -g --depth=0
