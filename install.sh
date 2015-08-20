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
      printf "${ylw}Installing zsh-completions settings....${normal}\n"
      git clone git://github.com/zsh-users/zsh-completions.git ~/zsh-completions
      
      printf "${blue}zsh-completions ready.${normal}\n"
    else
    progress sleep 0.5 
      printf "${blue}zsh-completions already installed.${normal}\n"      
    fi

    #vim neobundle/color settings
    if [ ! -e $HOME/.vim ]; then
      progress sleep 0.5
      printf "${ylw}Installing vim settings....${normal}\n"
      mkdir -p ~/.vim/bundle
      mkdir -p ~/.vim/colors
      git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
      git clone git://github.com/Shougo/vimproc.vim.git ~/.vim/bundle/vimproc

      printf "building vimproc ...\n."
      make -C ~/.vim/bundle/vimproc/
      git clone git://github.com/tomasr/molokai ~/.vim/colors/molokai
      cp ~/.vim/colors/molokai/colors/molokai.vim ~/.vim/colors/
      printf "${blue}vim ready.${normal}\n"
    else
      progress sleep 0.5
      printf "${blue}vim already installed.${normal}\n"
    fi
  
  progress sleep 0.5
  printf "${ylw}Enviorment ready!\n"

}

#-------------------------------------------------
#1 Dependecy setup

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


}

#-------------------------------------------------

function installDotFiles() {

  note "Linking dotfiles...\n"
  for file in .* ;
  do
    #無視するファイル
    case $file in
      .|..|.git*|.tag*)
        continue
        ;;
       .DS_Store)
        continue
      ;;
    #処理するファイル
    *)
    if [ -e $HOME/$file ]; then
      # ln -s $HOME/dotfiles/$file $HOME/$file.dot
      # printf "ファイルが存在しますから.dotファイルつくるよ: $file"
      progress sleep 0.5
      rm $HOME/$file
      ln -s $HOME/dotfiles/$file $HOME/$file
      printf "${cyan}既存のファイルがあったので勝手に更新しました: $file${normal}"
    else
      progress sleep 0.5
      ln -s $HOME/dotfiles/$file $HOME/$file
      printf "${cyan}シンボリックリンクを貼りました: $file${normal}"
    fi
    ;;
    esac
  done
  
  #REFRESH
  for refresh in .* ;
    do
      #無視するファイル
      case $refresh in
         .|.DS_Store|..|.git*|.tag*|.tmux*|.vimrc)
          continue
        ;;
      #処理するファイル
      *)
      printf "\n"
      zsh $HOME/$refresh 2>&1 >/dev/null
      printf "${cyan}refreshed: $refresh${normal}"
      ;;
      esac
    done
  }

#-------------------------------------------------
setup
# installDotFiles

printf "\n\n${ylw}COMPLEETED SETUP!\n\n"
