#!/bin/bash

#在Finder不展示MacOS的隐藏文件
defaults write com.apple.finder AppleShowAllFiles -bool false
KillAll Finder
