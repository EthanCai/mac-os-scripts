#!/bin/bash

# Install Java 7 or 8: https://java.com/en/download/help/mac_install.xml
# Uninstall Java 7 or 8: https://java.com/en/download/help/mac_uninstall_java.xml

sudo rm -fr "/Library/Internet Plug-Ins/JavaAppletPlugin.plugin"
sudo rm -fr "/Library/PreferencePanes/JavaControlPanel.prefpane"
sudo rm -fr "~/Library/Application\ Support/Java"
