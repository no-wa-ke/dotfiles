#!/bin/bash

#-------------------------------------------------
#external
. ./script/enviorment.sh
. ./script/set_os.sh
. ./script/GetEnvFiles.sh
. ./script/LinkDotFiles.sh

#-------------------------------------------------

function setup() {
  
 callLogo

  getOS # set_os.sh

  if [ $platform == 'mac' ]; then
    note "${cyan}Detected Mac OSX...\n"
    setMac # set_os.sh
    get_envFiles
  
  elif [ $platform == 'linux' ]; then
    note "${cyan}Detected Linux OS...\n"
    get_Linux_type # set_os.sh

    if [ $dtype == 'redhat' ]; then
      note "${cyan}Detected redhat...\n"
      setRedHat
      get_envFiles 
  
    elif [ $dtype == 'debian' ]; then
      note "${cyan}Detected Debian...\n"
      setDebian
      get_envFiles
    fi
  fi

linkDotFiles



}

#-------------------------------------------------

setup

printf "\n\n${ylw}COMPLEETED SETUP!\n\n"
printf "${cyan}make sure you refresh other dotfiles such as .vimrc, tmux...etc\n\n"
