#!/bin/bash

# 本脚本参考如下链接：
# https://support.office.com/zh-cn/article/%E4%BB%8E-Mac-%E4%B8%AD%E5%AE%8C%E5%85%A8%E5%88%A0%E9%99%A4-Office-2011-ba8d8d13-0015-4eea-b60b-7719c2cedd17?ui=zh-CN&rs=zh-CN&ad=CN
#

function delete() {
    len=${#folders[@]}

    for ((i=0;i<$len;i++))
    do
        item=${folders[$i]}

        if [[ "$item" == *\* ]]
            then
                line=$(eval "ls ${item} 2>/dev/null | wc -l")
                if [ $line -gt 0 ]
                    then
                    rm -f "$item"
                    echo -e [files] $item is deleted "\n"
                    continue
                fi
        fi

        if [ -f "$item" ]
            then
            rm -f "$item"
            echo -e [file] $item is deleted "\n"
            continue
        fi

        if [ -d "$item" ]
            then
            rm -drf "$item"
            echo -e [folder] $item is deleted "\n"
            continue
        fi
    done
}

# 1. Remove the Microsoft Office 2011 folder:
# /Applications/Microsoft Lync.app/
# /Applications/Microsoft Office 2011/
# /Applications/Remote Desktop Connection/
# /Applications/Microsoft Communicator/
# /Applications/Microsoft Messenger/

folders=("/Applications/Microsoft Lync.app" \
"/Applications/Microsoft Office 2011" \
"/Applications/Remote Desktop Connection" \
"/Applications/Microsoft Communicator" \
"/Applications/Microsoft Messenger")

delete

# 2. Remove preference and license files and Office folder
# ~/Library/Preferences/com.microsoft*
# ~/Library/Preferences/ByHost/com.microsoft*
# ~/Library/Application Support/Microsoft/       应用程序支持
# /Library/LaunchDaemons/com.microsoft.office.licensing.helper.plist
# /Library/Preferences/com.microsoft.office.licensing.plist        许可证文件
# /Library/PrivilegedHelperTools/com.microsoft.office.licensing.helper

folders=("$HOME/Library/Preferences/com.microsoft*" \
"$HOME/Library/Preferences/ByHost/com.microsoft*" \
"$HOME/Library/Application Support/Microsoft" \
"/Library/LaunchDaemons/com.microsoft.office.licensing.helper.plist" \
"/Library/Preferences/com.microsoft.office.licensing.plist" \
"/Library/PrivilegedHelperTools/com.microsoft.office.licensing.helper")

delete

# 3. 删除Microsoft文件夹和Office 2011文件
# /Library/Automator
# /Library/Application Support/Microsoft/
# /Library/Fonts/Microsoft              如要删除，请把此路径加到folders数组中
# /Library/Internet Plug-Ins/           all SharePoint files
# /Library/Receipts/Office_2011*
# /private/var/db/receipts/com.microsoft.office*

folders=("/Library/Automator" \
"/Library/Application Support/Microsoft" \
"/Library/Internet Plug-Ins" \
"/Library/Receipts/Office_2011*" \
"/private/var/db/receipts/com.microsoft*")

delete

# 4. 删除用户数据，注意：如果有重要数据，请先备份
# ~/Documents/Microsoft User Data/
# ~/Documents/Microsoft 用户数据/

folders=("$HOME/Documents/Microsoft User Data" \
"$HOME/Documents/Microsoft 用户数据")

delete

# 最后清除Trash，并从Dock中删除MS Office 2011 for Mac图标
