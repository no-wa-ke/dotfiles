#!/bin/bash

#-------------------------------------------------
#external
. ./src/enviorment.sh
. ./src/set_os.sh

#-------------------------------------------------
function getFiles(){

path=(zsh-completions .vim)

  note "Setting up your enviorment...\n"
  
    #zsh completetion
    if [ ! -e $HOME/zsh-completions ]; then
    progress sleep 0.5  
      echo "${ylw}Installing zsh-completions settings....${normal}\n"
      git clone git://github.com/zsh-users/zsh-completions.git ~/zsh-completions
      
      echo "${blue}zsh-completions ready.${normal}\n"
    else
      echo "${blue}zsh-completions already installed.${normal}\n"      
    fi

    #vim neobundle/color settings
    if [ ! -e $HOME/.vim ]; then
      progress sleep 0.5
      echo "${ylw}Installing vim settings....${normal}\n"
      mkdir -p ~/.vim/bundle
      mkdir -p ~/.vim/colors
      git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
      git clone git://github.com/Shougo/vimproc.vim.git ~/.vim/bundle/vimproc
      make -C ~/.vim/bundle/vimproc/
      git clone git://github.com/tomasr/molokai ~/.vim/colors/molokai
      cp ~/.vim/colors/molokai/colors/molokai.vim ~/.vim/colors/
      echo "${blue}vim ready.${normal}\n"
    else
      echo "${blue}vim already installed.${normal}\n"
    fi
  
  progress sleep 0.5
  echo "${ylw}Enviorment ready!\n"

}

#-------------------------------------------------
#1 Dependecy setup

function setup() {
  
 logo

  getOS # set_os.sh

  if [ $platform == 'mac' ]; then
    note "${cyan}Detected Mac OSX...\n"
    setMac # set_os.sh

  elif [ $platform == 'linux' ]; then
    note "\tDetected Linux OS...\n"
    porgress sleep 0.5
    get_Linux_type # set_os.sh

    if [ $dtype == 'redhat' ]; then
      note "\tDetected redhat...not yet developed\n"
      # setRedHat
      exit 1
    elif [ $dtype == 'debian' ]; then
      note "\tDetected redhat...not yet developed\n"
      # setDebian
      exit 1
    fi
  fi
getFiles

}

#-------------------------------------------------

function installDotFiles() {

  note "Linking dotfiles...\n"
  for file in .* ;
  do
    #無視するファイル
    case $file in
      .|..|.git)
        continue
        ;;
       .DS_Store)
        continue
      ;;
    #処理するファイル
    *)
    if [ -a $HOME/$file ]; then
      # ln -s $HOME/dotfiles/$file $HOME/$file.dot
      # echo "ファイルが存在しますから.dotファイルつくるよ: $file"
      progress sleep 0.5
      rm $HOME/$file
      ln -s $HOME/dotfiles/$file $HOME/$file
      echo "${cyan}既存のファイルがあったので勝手に更新しました: $file${normal}"
    else
      progress sleep 0.5
      ln -s $HOME/dotfiles/$file $HOME/$file
      echo "${cyan}シンボリックリンクを貼りました: $file${normal}"
    fi
    ;;

    esac

  done

}

#-------------------------------------------------
setup
installDotFiles

echo "\n\n${ylw}COMPLEETED SETUP!\n\n"
