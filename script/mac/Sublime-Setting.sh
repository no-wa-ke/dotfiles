#!/bin/bash
. ./script/enviorment.sh

progress sleep 0.5
echo "${cyan}setting up sublime text...${normal}"

if [ -e /Applications/Sublime\ Text.app/ ]; then
#TODO:SublimeText Settings

# ls ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
rm -rf ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
ln -s ~/dotfiles/src/sublime/User/ ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User

progress sleep 0.5
echo "${cyan}Sublime-Text is now ready to boot!${normal}"
else

echo "${red}Sublime Text is not installed. Skipping this step....${normal}"
fi