#!/bin/bash
. ./script/enviorment.sh

#TODO:SublimeText Settings
echo "${ylw}setting up sublime text...${normal}"

# ls ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
rm -rf ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
ln -s ~/dotfiles/src/sublime/User/ ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User

echo "${ylw}Sublime text ready to use...${normal}"