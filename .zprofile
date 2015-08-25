
alias dev='cd $HOME/MyVagrant/dev'
alias runsv='sudo apachectl start'
alias endsv='sudo apachectl stop'
alias sl='sublime'
alias myhome='cd ~/github_tester'
alias tat='tmux attach -t'
alias imageByDate='$HOME/MyVagrant/workspace/imageByDate/execute.sh'
alias lolipop='ssh main.jp-kidoyoji@ssh048.lolipop.jp -p 2222'
alias myimac='ssh nowake@imac-2.268546406.members.btmm.icloud.com'
alias myHub='open https://github.com/no-wa-ke/'
alias tmux="tmux -2"
alias hex2dec="printf '%d\n'"
alias dec2hex="printf '%x\n'"

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
	PATH=$PATH:/usr/local/lib/node_modules
	PATH=$PATH:/usr/local/heroku/bin ### Added by the Heroku Toolbel
	
	export PATH
	
	export NODE_PATH=/usr/local/lib/node_module
	
	






