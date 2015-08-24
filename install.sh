#!/bin/bash

#-------------------------------------------------
#external
. ./src/enviorment.sh
. ./src/set_os.sh
. ./src/GetFiles.sh
. ./src/installDotFiles.sh

#-------------------------------------------------

function setup() {
  
 callLogo

  getOS # set_os.sh

  if [ $platform == 'mac' ]; then
    note "${cyan}Detected Mac OSX...\n"
    setMac # set_os.sh
    getFiles
  elif [ $platform == 'linux' ]; then
    note "${cyan}Detected Linux OS...\n"
    get_Linux_type # set_os.sh

    if [ $dtype == 'redhat' ]; then
      note "${cyan}Detected redhat...\n"
      setRedHat
      getFiles 
    elif [ $dtype == 'debian' ]; then
      note "${cyan}Detected redhat..\n"
      setDebian
      getFiles
    fi
  fi

  InstallDotFiles


}

#-------------------------------------------------

setup

printf "\n\n${ylw}COMPLEETED SETUP!\n\n"
