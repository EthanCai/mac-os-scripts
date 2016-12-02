#!/bin/bash

# Install Java 7 or 8: https://java.com/en/download/help/mac_install.xml
# Uninstall Java 7 or 8: https://java.com/en/download/help/mac_uninstall_java.xml
# Use `/usr/libexec/java_home -v 1.8` command on a terminal shell to figure out where is your java 1.8 home directory

# remove jdk
sudo rm -fr "/Library/Java/JavaVirtualMachines/*"

# remove jre
sudo rm -fr "/Library/Internet Plug-Ins/JavaAppletPlugin.plugin"
sudo rm -fr "/Library/PreferencePanes/JavaControlPanel.prefpane"
sudo rm -fr "~/Library/Application\ Support/Java"
