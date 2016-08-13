#!/bin/bash

# 彻底卸载node和npm
# 参考：http://stackoverflow.com/questions/11177954/how-do-i-completely-uninstall-node-js-and-reinstall-from-beginning-mac-os-x#

sudo rm -rf /usr/local/lib/{node,node_modules}
sudo rm -rf /usr/local/include/{node,node_modules}
sudo rm -rf ~/{.node*,.npm}
sudo rm -rf /usr/local/share/man/man1/node* /usr/local/lib/dtrace/node.d
sudo rm -rf /usr/local/share/doc/node
sudo rm -f /usr/local/share/systemtap/tapset/node.stp
sudo rm -f /usr/local/bin/{node,npm}

brew uninstall node
