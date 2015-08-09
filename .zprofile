
#export TERM=xterm-256color

export EDITOR='/usr/bin/emacs -nw'

# alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'

# alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'

alias emacs='/usr/bin/emacs -nw'

alias ls='ls -G'
alias la='ls -la'

export LSCOLORS=gxfxcxdxbxegedabagacad

alias subpack='cd /Users/mty1245/Library/Application\ Support/Sublime\ Text\ 2/Packages/'

alias lfile='cd ~/github_tester/'

alias dev='cd ~/MyVagrant/dev'

alias mySite='cd /Users/mty1245/github_tester/sandbox/newKido/'

alias runsv='sudo apachectl start'

alias endsv='sudo apachectl stop'

alias bconfig='sl /Users/mty1245/.bashrc'

alias rsblm='sublime /Users/mty1245/github_tester/SFTP/sftp-config.json'

alias sl='sublime'

alias lhost='open http://localhost'

alias ofx='cd /Volumes/hdd02/app'

alias lofx='cd /Users/mty1245/OF/of_v0.8.1_osx_release'

alias lofxi='cd /Users/mty1245/OF/of_v0.8.1_ios_release'

alias myhome='cd /Users/mty1245/github_tester'
alias tat='tmux attach -t'

alias hdd2='cd /Volumes/hdd02'

alias hofx8='cd /Volumes/hdd02/app/OF/of_v0.8.3_osx_release'
alias hofx7='cd /Volumes/hdd02/app/OF/of_v0.7.4_osx_release'
alias jsbin='open /Users/mty1245/node_modules/jsbin/bin/jsbin'

alias imageByDate='/Users/mty1245/MyVagrant/workspace/imageByDate/execute.sh'

alias lolipop='ssh main.jp-kidoyoji@ssh048.lolipop.jp -p 2222'

alias ctags="`brew --prefix`/bin/ctags"

alias myimac='ssh nowake@imac-2.268546406.members.btmm.icloud.com'
alias gini="git init"
alias gad="git add -A"
alias gco="git checkout"
alias gst="git status"
alias gci="git commit -a"
alias gdi="git diff"
alias gbr="git branch"
alias midiJoin="/Users/mty1245/Library/Developer/Xcode/DerivedData/midiJoin-evkvwtrqftrudldpeykjxyadcrtg/Build/Products/Debug/midiJoin"

alias myHub='open https://github.com/no-wa-ke/'
alias tmux="tmux -2"

### Added by the Heroku Toolbelt

export PATH="/usr/local/heroku/bin:$PATH"

### Nodeとかrbenvとか
export PATH="$HOME/.node/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
