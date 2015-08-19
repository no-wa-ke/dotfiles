function getOS() {
  
  if [ "$(uname)" == 'Darwin' ]; then
    platform='mac' 
  elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
    platform='linux' 
  elif [ "$(expr substr $(uname -s) 1 10)" == 'MINGW32_NT' ]; then                                                                                           
    echo "${i}This script does not support Windows"
    exit 1
  else
    echo "Your platform ($(uname -a)) is not supported."
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

    read  -p "${ylw}Do you wish to update Homebrew(may take a while)(y/n)?=>  ${normal}" yn
    case $yn in
        [Yy]* ) brew update; ;;
        [Nn]* ) echo "\n Okay.Processing without updating.\n"; ;;
        * ) echo "${red}Please answer yes or no."
            echo "Terminating."
            exit;;
    esac

  note "Setting up for Macintosh using brew...\n"
  progress sleep 0.5


  if [[ vim ]]; then
    echo "${cyan}vim already installed.Ignoring.${normal}\n"
    progress sleep 0.5
  else
    echo "${ylw}vim not found. Installing vim ....${normal}\n"
    brew install vim
    progress sleep 0.5
  fi
  
  if [[ zsh ]]; then
    echo "${cyan}zsh already installed.Ignoring.${normal}\n"
    progress sleep 0.5
  else
    echo "${ylw}zsh not found. Installing vim ....${normal}\n"
    brew install zsh
    chsh -s /bin/zsh
    progress sleep 0.5
  fi

  if [[ tmux ]]; then
    echo "${cyan}tmux already installed.Ignoring.${normal}\n"
    progress sleep 0.5
  else
    echo "${ylw}tmux not found. Installing vim ....${normal}\n"
    brew install tmux
    progress sleep 0.5
  fi
 
    echo "${ylw}Dependecies ready!\n"


}


#-------------------------------------------------
#WIP
setRedHat() {
  note "Setting up for Redhat using yum...\n"
  progress sleep 0.5

  sudo yum -y install zsh
  sudo yum -y update vim 
  sudo yum -y install rsync 
}


#-------------------------------------------------
#WIP
setDebian() {
  note "Setting up for Debian using apt-get...\n" 
  progress sleep 0.5

  apt-get install zsh
  apt-get install vim
}
