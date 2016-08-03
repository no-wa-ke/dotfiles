#!/bin/bash

function linkDotFiles () {

  #-------------------------------------------
  function BOver(){
      bOver=true

  while true; do
    read -p "Do you wish to overwrite dotfiles?(y/n) => : " yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) bOver=false; break;;
        * ) echo "Please answer yes or no.";;
    esac
  done

  }
  #-------------------------------------------
  function setLink() {
    
  BOver

  note "Linking dotfiles...\n"

  #ディレクトリ以外を指定
  for file in $(find $HOME/dotfiles/src -name '.*' ! -type d | sed 's#.*/##') ;
  do   
    case $file in
       .git*|.tag*)
        continue
        ;;
       .DS_Store)
        continue
      ;;
    #処理するファイル
    *)
      if $bOver; then    
      rm $HOME/$file
      ln -s $HOME/dotfiles/src/$file $HOME/$file
      printf "${cyan}Overwrote $file: $HOME/$file${normal}\n"
      else
      ln -s $HOME/dotfiles/src/$file $HOME/$file.dot
      printf "${cyan}Created $file.dot: $HOME/$file.dot${normal}\n"
      fi
      ;;
    esac
  done
  sh ./script/mac/Sublime-Setting.sh
  
  return 0

  }

  if setLink $1 ; then #$1 引数(return 0)ならば〜
    
  progress sleep 0.5
  printf "${ylw}Symbolics Ready!\n\n"  
  else
  printf "${red}Could not locate your symbolic link.\n\n"  
  fi
  

  #-------------------------------------------
  function doRefresh (){
  
  note "zshに初期化...\n"
  chsh -s /bin/zsh
  for refresh in $(find $HOME/dotfiles/src -name '.*' ! -type d | sed 's#.*/##') ;
    do
      #無視するファイル
      case $refresh in
         .|.DS_Store|..|.git*|.tag*|.tmux*|.vimrc)
          continue
        ;;
      #処理するファイル
      *)
      printf "\n"
      zsh $HOME/$refresh 2>&1 >/dev/null #zshで処理すること
      printf "${cyan}refreshed: $refresh${normal}"
      ;;
      esac
    done

    return 0
  
  }

  if doRefresh $1 ; then 
  printf "\n"
  progress sleep 0.5
  printf "${ylw}Refreshed your enviorment!\n\n"  
  else
  printf "${red}Could not refresh your enviorment\n\n"  
  fi
  

  }
