#!/bin/bash

alias dev='cd $HOME/MyVagrant/dev'
alias runsv='sudo apachectl start'
alias endsv='sudo apachectl stop'
alias sl='subl'
alias myhome='cd ~/github_tester'
alias tat='tmux attach -t'
alias imageByDate='$HOME/MyVagrant/workspace/imageByDate/execute.sh'
alias lolipop='ssh main.jp-kidoyoji@ssh048.lolipop.jp -p 2222'
alias myimac='ssh nowake@imac-2.268546406.members.btmm.icloud.com'
alias myHub='open https://github.com/no-wa-ke/'
alias tmux="tmux -2"
alias hex2dec="printf '%d\n'"
alias dec2hex="printf '%x\n'"
alias glog="tail -f /var/log/system.log | ccze -A"
alias ofx="cd ~/github_tester/OF/"
alias ws="cd ~/workspace"
alias t2="tree -L 2"
alias gulp-php-skelton="sh ~/workspace/gulp-php-skelton/make.sh"
alias rszp="sh ~/workspace/shell/imageResize.sh"
alias aws="ssh -i ~/workspace/keys/aws/yk-test-app.pem ec2-user@ec2-52-36-183-238.us-west-2.compute.amazonaws.com"
##OS DEPENDENCIES(TODO:別ファイルに分ける)

case "${OSTYPE}" in
darwin*)
  	# Mac
  	
	alias ls="ls -GF"
	alias la="ls -la"
	alias ctags="`brew --prefix`/bin/ctags"
      	;;
linux*)
	 # Linux
	 alias ls='ls -F --color'
  ;;
esac
	#PATH設定
	PATH=$PATH:$HOME/.node/bin
	PATH=$PATH:$HOME/.rbenv/bin
	PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
	PATH=$PATH:$HOME/.node/bin/npm
	PATH=$PATH:/usr/local/lib/node_modules
	PATH=$PATH:/usr/local/heroku/bin ### Added by the Heroku Toolbel
		
	
	export PATH
	
	export NODE_PATH=/usr/local/lib/node_module

	# Setting PATH for Python 3.5
	# The orginal version is saved in .zprofile.pysave
	export PYENV_ROOT="$HOME/.pyenv"
	export PATH="$PYENV_ROOT/bin:$PATH"
	eval "$(pyenv init -)"
	# export MECAB_PATH=/usr/local/Cellar/mecab/0.996/lib/libmecab.dylib 	
	# if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
	# eval "$(anyenv init -)"
# Initialization for FDK command line tools.Fri Oct 30 23:13:43 2015
FDK_EXE="/Users/ykido/bin/FDK/Tools/osx"
PATH=${PATH}:"/Users/ykido/bin/FDK/Tools/osx"
export PATH
export FDK_EXE
