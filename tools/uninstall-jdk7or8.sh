#!/bin/bash

# Install Java 7 or 8: https://java.com/en/download/help/mac_install.xml
# Uninstall Java 7 or 8: https://java.com/en/download/help/mac_uninstall_java.xml
# Use `/usr/libexec/java_home` command on a terminal shell to figure out where is your java 1.8 home directory
# References:
# - Understanding Oracle's Java on Mac: https://stackoverflow.com/questions/15120745/understanding-oracles-java-on-mac

# remove jdk

# > tree -L 4
# .
# └── jdk-9.jdk
#     └── Contents
#         ├── Home
#         │   ├── README.html
#         │   ├── bin
#         │   ├── conf
#         │   ├── include
#         │   ├── jmods
#         │   ├── legal
#         │   ├── lib
#         │   └── release
#         ├── Info.plist
#         └── MacOS
#             └── libjli.dylib -> ../Home/lib/jli/libjli.dylib
#
# 10 directories, 4 files
sudo rm -fr /Library/Java/JavaVirtualMachines/*

# > tree -L 3 "/Library/Internet Plug-Ins/JavaAppletPlugin.plugin"
# /Library/Internet\ Plug-Ins/JavaAppletPlugin.plugin
# └── Contents
#     ├── Frameworks
#     │   └── Sparkle.framework
#     ├── Home
#     │   ├── README.html
#     │   ├── bin
#     │   ├── conf
#     │   ├── legal
#     │   ├── lib
#     │   └── release
#     ├── Info.plist
#     ├── MacOS
#     │   └── JavaAppletPlugin -> ../Home/lib/libnpjp2.dylib
#     ├── Plugins
#     └── Resources
#         ├── Helper-Tool
#         ├── Java\ Updater.app -> JavaUpdater.app
#         ├── Java7VM.icns
#         ├── JavaControlPanelHelper
#         ├── JavaUpdater.app
#         ├── JavawsLauncher.app
#         ├── com.oracle.java.Helper-Tool.plist
#         ├── com.oracle.java.Java-Updater.plist
#         ├── de.lproj
#         ├── dsa_pub.pem
#         ├── en.lproj
#         ├── es.lproj
#         ├── fr.lproj
#         ├── it.lproj
#         ├── ja.lproj
#         ├── ko.lproj
#         ├── menuextraicon.png
#         ├── pt_BR.lproj
#         ├── sv.lproj
#         ├── zh_CN.lproj
#         └── zh_TW.lproj
#
# 25 directories, 11 files
sudo rm -fr "/Library/Internet Plug-Ins/JavaAppletPlugin.plugin"

# > tree -L 3 /Library/PreferencePanes/JavaControlPanel.prefpane
# /Library/PreferencePanes/JavaControlPanel.prefpane
# └── Contents
#     ├── Info.plist
#     ├── MacOS
#     │   └── JavaControlPanel
#     └── Resources
#         ├── Java7VM.icns
#         ├── JavaControlPanel.nib
#         ├── JavaCupLogo-161.png
#         ├── de.lproj
#         ├── en.lproj
#         ├── es.lproj
#         ├── fr.lproj
#         ├── it.lproj
#         ├── ja.lproj
#         ├── ko.lproj
#         ├── pt_BR.lproj
#         ├── sv.lproj
#         ├── zh_CN.lproj
#         └── zh_TW.lproj
#
# 14 directories, 5 files
sudo rm -fr "/Library/PreferencePanes/JavaControlPanel.prefpane"
