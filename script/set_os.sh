#!/bin/bash

function getOS() {
  
  if [ "$(uname)" == 'Darwin' ]; then
    platform='mac' 
  elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
    platform='linux' 
  elif [ "$(expr substr $(uname -s) 1 10)" == 'MINGW32_NT' ]; then                                                                                           
    printf "${i}This script does not support Windows"
    exit 1
  else
    printf "Your platform ($(uname -a)) is not supported."
    exit 1
  fi
}
#-------------------------------------------------
#Linuxのディストリビューションを確認/ dtypeに保存  
function get_Linux_type() {
    
    # First test against Fedora / RHEL / CentOS / generic Redhat derivative
    if [ -r /etc/rc.d/init.d/functions ]; then
        source /etc/rc.d/init.d/functions
        [ zz`type -t passed 2>/dev/null` == "zzfunction" ] && dtype="redhat"

    # Then test against SUSE (must be after Redhat,
    # I've seen rc.status on Ubuntu I think? TODO: Recheck that)
    elif [ -r /etc/rc.status ]; then
        source /etc/rc.status
        [ zz`type -t rc_reset 2>/dev/null` == "zzfunction" ] && dtype="suse"

    # Then test against Debian, Ubuntu and friends
    elif [ -r /lib/lsb/init-functions ]; then
        source /lib/lsb/init-functions
        [ zz`type -t log_begin_msg 2>/dev/null` == "zzfunction" ] && dtype="debian"

    # Then test against Gentoo
    elif [ -r /etc/init.d/functions.sh ]; then
        source /etc/init.d/functions.sh
        [ zz`type -t ebegin 2>/dev/null` == "zzfunction" ] && dtype="gentoo"

    # For Slackware we currently just test if /etc/slackware-version exists
    # and isn't empty (TODO: Find a better way :)
    elif [ -s /etc/slackware-version ]; then
        dtype="slackware"
    fi

}

## Setting Up | Methods for each OS ##
#-------------------------------------------------
setMac() {

# Check Xcode.app existence
if [ ! -e "/Applications/Xcode.app" ]; then
    echo "*** ${red}[Error] There is no Xcode.app, please install it first***${normal}"
    exit 1
fi

read  -p "${ylw}Install Lite-version or Complete Version(l/c)?=>  ${normal}" lc
    case $lc in
        [Ll]* ) sh ./script/mac/LiteInstall.sh; ;;
        [Cc]* ) sh ./script/mac/CompleteInstall.sh; ;;
        * ) printf "${red}Please answer yes or no."; ;;
    esac
# read  -p "${ylw}Do you wish to update Homebrew(may take a while)(y/n)?=>  ${normal}" yn
#     case $yn in
#         [Yy]* ) brew update; ;;
#         [Nn]* ) printf "\n Okay.Processing without updating.\n\n"; ;;
#         * ) printf "${red}Please answer yes or no."; ;;
#     esac

}


#-------------------------------------------------
#WIP
setRedHat() {
  
  programs=(vim zsh tmux)

  note "Setting up for Redhat using yum...\n"
  progress sleep 0.5

  for i in "${programs[@]}"
  do
  if [ $i ]; then
      printf "${cyan}$i already installed.Ignoring.${normal}\n"
      progress sleep 0.5
  else
      printf "${cyan}Installing $i ...${normal}\n"
      sudo yum -y install $i
      printf "${cyan}updating $i ...${normal}\n"
      sudo yum -y update $i
      progress sleep 0.5
  fi

  done

      printf "${ylw}Dependecies ready!\n"
}


#-------------------------------------------------
#WIP
setDebian() {
  programs=(vim zsh tmux)

  note "Setting up for Debian using apt-get...\n"
  progress sleep 0.5

  for i in "${programs[@]}"
  do
  if [ $i ]; then
      printf "${cyan}$i already installed.Ignoring.${normal}\n"
      progress sleep 0.5
  else
      apt-get -y install $i
      progress sleep 0.5
  fi
  done

}
