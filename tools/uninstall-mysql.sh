#!/bin/bash

# Use unofficial Bash Strict Mode
set -euo pipefail
IFS=$'\n\t'

rm /usr/local/mysql
rm -rf /usr/local/mysql*
rm -rf /Library/StartupItems/MySQLCOM
rm -rf /Library/PreferencePanes/MySQL*
rm -rf ~/Library/PreferencePanes/My*
rm -rf /Library/Receipts/mysql*
rm -rf /Library/Receipts/MySQL*
rm -rf /private/var/db/receipts/*mysql*

echo 'At last, please edit /etc/hostconfig and remove the line MYSQLCOM=-YES-'
