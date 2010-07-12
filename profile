# Aliases
alias l.='ls -d .*'
alias la='ls -a'
alias ll='ls -lA'
alias asearch='apt-cache search'

# Todo management
alias t='/home/user/bin/todo.sh'

# For todo script tab completion
source ~/.todo/todo_completer.sh
complete -F _todo_sh -o default t

# Histry settings
export HISTCONTROL=ignoredups
export HISTIGNORE="ls:ll:la:l.:pwd:exit:clear"

export EDITOR=vim

# Add ~/bin to path
PATH=$PATH:/home/user/bin
PYTHONPATH=$PYTHONPATH:/home/user/lib/python

# Find an ssh-agent socket or start a new agent
if test -z "$SSH_AUTH_SOCK" && test -x /usr/bin/ssh-agent; then
	sock=`netstat -l 2>/dev/null|grep ssh-|cut -c 58-|head -n 1`
	if test -n "$sock"; then
		export SSH_AUTH_SOCK=$sock
	else
		eval `ssh-agent`
	fi
fi

# Helpful functions 
extract () {
	if [ -f $1 ] ; then
		case $1 in
			*.tar.bz2) 	tar xjf $1 	;;
			*.tar.gz) 	tar xzf $1 	;;
#			*.bz) 		bunzip2 $1 	;;
#			*.rar) 		unrar x $1 	;;
			*.gz) 		gunzip $1 	;;
			*.tar) 		tar xf $1 	;;
			*.tbz2) 	tar xjf $1 	;;
			*.tgz) 		tar xzf $1 	;;
#			*.zip) 		unzip $1 	;;
#			*.Z) 		uncompress $1 	;;
			*) 		echo "'$1' cannot be extracted via extract()" 	;;
		esac
	else
		echo "'$1' is not a valid file"
	fi
}

#mkdir, cd into it
function mkcd () {
	mkdir -p "$*"
	cd "$*"
}
