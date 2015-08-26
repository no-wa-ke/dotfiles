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
  printf "[32;1m * [0m$*"
}
function progress(){
#install.sh に呼び出されるのでパスはホームから
. ./script/progress-bar.sh
}
function callLogo(){
printf "\n\n"
printf "#### DOTFILES SETUP ####\n"
printf "#### By Yoji Kido    ####\n\n" 
cat << "EOF"

██████╗  ██████╗ ████████╗███████╗██╗██╗     ███████╗███████╗
██╔══██╗██╔═══██╗╚══██╔══╝██╔════╝██║██║     ██╔════╝██╔════╝
██║  ██║██║   ██║   ██║   █████╗  ██║██║     █████╗  ███████╗
██║  ██║██║   ██║   ██║   ██╔══╝  ██║██║     ██╔══╝  ╚════██║
██████╔╝╚██████╔╝   ██║   ██║     ██║███████╗███████╗███████║
╚═════╝  ╚═════╝    ╚═╝   ╚═╝     ╚═╝╚══════╝╚══════╝╚══════╝
                                                               
EOF

}
