#!/bin/bash


#global variable
platform='unknown'
dtype='unknown'

#Print setting
bold=$(tput bold)
uLine=$(tput smul)
normal=$(tput sgr0)
green=$(tput setaf 2)
ylw=$(tput setaf 3)
red=$(tput setaf 1)
cyan=$(tput setaf 6)
blue=$(tput setaf 4)


function note() {
  echo "[32;1m * [0m$*"
}
function progress(){
#install.sh に呼び出されるのでパスはホームから
. ./src/progress-bar.sh
}
function callLogo(){
echo "\n"
echo "#### DOTFILES SETUP ####"
echo "#### By No-wa-ke    ####\n" 
cat << "EOF"

██████╗  ██████╗ ████████╗███████╗██╗██╗     ███████╗███████╗
██╔══██╗██╔═══██╗╚══██╔══╝██╔════╝██║██║     ██╔════╝██╔════╝
██║  ██║██║   ██║   ██║   █████╗  ██║██║     █████╗  ███████╗
██║  ██║██║   ██║   ██║   ██╔══╝  ██║██║     ██╔══╝  ╚════██║
██████╔╝╚██████╔╝   ██║   ██║     ██║███████╗███████╗███████║
╚═════╝  ╚═════╝    ╚═╝   ╚═╝     ╚═╝╚══════╝╚══════╝╚══════╝
                                                               
EOF

}
