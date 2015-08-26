#!/bin/bash
function get_envFiles(){

  note "Setting up your enviorment...\n"
  
    #zsh completetion
    if [ ! -e $HOME/zsh-completions ]; then
    progress sleep 0.5  
      printf "${ylw}Installing zsh-completions settings....${normal}\n"
      git clone git://github.com/zsh-users/zsh-completions.git $HOME/zsh-completions
        
      printf "${blue}zsh-completions ready.${normal}\n"
    else
    progress sleep 0.5 
      printf "${blue}zsh-completions already installed.${normal}\n"      
    fi

    #vim neobundle/color settings
    if [ ! -e $HOME/.vim ]; then
      progress sleep 0.5
      printf "${ylw}Installing vim settings....${normal}\n"
      mkdir -p $HOME/.vim/bundle
      mkdir -p $HOME/.vim/colors
      git clone git://github.com/Shougo/neobundle.vim $HOME/.vim/bundle/neobundle.vim
      git clone git://github.com/Shougo/vimproc.vim.git $HOME/.vim/bundle/vimproc

      printf "building vimproc ...\n."
      make -C $HOME/.vim/bundle/vimproc/
      git clone git://github.com/tomasr/molokai $HOME/.vim/colors/molokai
      cp $HOME/.vim/colors/molokai/colors/molokai.vim $HOME/.vim/colors/
      printf "${blue}vim ready.${normal}\n"
    else
      progress sleep 0.5
      printf "${blue}vim already installed.${normal}\n"
    fi
  progress sleep 0.5
  printf "${ylw}Enviorment ready!\n\n"

}
