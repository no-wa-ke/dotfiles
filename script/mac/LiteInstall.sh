#!/bin/bash
. ./script/enviorment.sh

# Install homebrew
if [ ! -e /usr/local/bin/brew ]; then
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# brew doctor
fi
if [ ! -e /usr/local/bin/git ]; then
# Update homebrew
brew install git
fi

programs=(vim zsh tmux)

note "Setting up as lite-version...\n"
progress sleep 0.5

  for i in "${programs[@]}"
  do
    if [ $i ]; then
        printf "${cyan}$i already installed.Ignoring.${normal}\n"
        progress sleep 0.5
    else
        brew install $i
        progress sleep 0.5
    fi
  done

printf "${ylw}Installed Lite packages!{$normal}\n\n"

progress sleep 0.5
sh ./script/mac/Sublime-Setting.sh