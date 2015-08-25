function InstallDotFiles () {

  #setLink -> doRefresh

  function setLink() {
  
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
      # TODO:既存のファイルとの共存をたもつ処理をかく

      # ln -s $HOME/dotfiles/$file $HOME/$file.dot
      # printf "ファイルが存在しますから.dotファイルつくるよ: $file"
      progress sleep 0.5
      rm $HOME/$file
      ln -s $HOME/dotfiles/$file $HOME/$file
      printf "${cyan}既存のファイルがあったので勝手に更新しました: $file${normal}\n"
    else
      progress sleep 0.5
      ln -s $HOME/dotfiles/$file $HOME/$file
      printf "${cyan}シンボリックリンクを貼りました: $file${normal}\n"
    fi
    ;;
    esac
  done
  return 0
  }

    if setLink $1 ; then #実行してboolを得る
    progress sleep 0.5
    printf "${ylw}Symbolics Ready!\n\n"  
    else
    printf "${red}Could not locate your symbolic link.\n\n"  
    fi
    
  function doRefresh (){

  note "zshに初期化...\n"
  chsh -s /bin/zsh

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
    return 0
  }

    #実行して判断する
    if doRefresh $1 ; then 
    printf "\n"
    progress sleep 0.5
    printf "${ylw}Refreshed your enviorment!\n\n"  
    else
    printf "${red}Could not refresh your enviorment\n\n"  
    fi
  
  }