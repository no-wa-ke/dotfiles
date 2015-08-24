function getFiles(){

path=(zsh-completions .vim)

  note "Setting up your enviorment...\n"
  
    ###zsh completetion
    if [ ! -e $HOME/zsh-completions ]; then
      progress sleep 0.5  
      printf "${ylw}Installing zsh-completions settings....${normal}\n"
      git clone git://github.com/zsh-users/zsh-completions.git ~/zsh-completions
      printf "${blue}zsh-completions ready.${normal}\n"
    else
      progress sleep 0.5 
      printf "${blue}zsh-completions already installed.${normal}\n"      
    fi

    ###vim neobundle/color settings
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
  printf "${ylw}Enviorment ready!\n\n"

}
