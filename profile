# Aliases
alias l.='ls -Gd .*'
alias la='ls -aG'
alias lf='ls -FA'
alias ll='ls -lAG'
alias ls='ls -G'
alias ping='ping -c 4'
# Todo management
alias t='/opt/local/bin/todotxt'
# Databases
alias mysql='/opt/local/bin/mysql5'
alias psql='psql -U postgres'
# OS X specific
alias qlook='qlmanage -p "$@" >& /dev/null'

# Until I set apache/mysql query browser/mysql administrator to use the right socket, just symlink between the place they look (/tmp/mysql.sock) and the correct location (in /opt/local).
alias mysql_resock='sudo ln -s /opt/local/var/run/mysql5/mysqld.sock /tmp/mysql.sock'

# For todo script tab completion
source ~/bin/todo_completer.sh
complete -F _todo_sh -o default t

# Multiple history files by shell id
SHELLID=$(tty | sed 's!/!.!g')
HISTFILE=$HISTFILE$SHELLID
export HISTCONTROL=ignoredups
export HISTIGNORE="ls:ll:la:l.:pwd:exit:clear"

# MacPorts
export PATH=/opt/local/bin:/opt/local/sbin:/opt/local/lib/postgresql83/bin:/Users/vigevenoj/bin:$PATH
export MANPATH=/opt/local/share/man:$MANPATH
export EDITOR=vim

# For running KDE4 apps
export XDG_DATA_DIRS=/opt/local/share

# KDE can't find the session bus address on OS X:
#  (Apps want DBUS_SESSION_BUS_ADDRESS to be defined)
export DBUS_SESSION_BUS_ADDRESS="launchd:env=DBUS_LAUNCHD_SESSION_BUS_SOCKET"

# Bash Completion from macports
if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
fi

# Move newly-downloaded music into iTunes
function new_music() { 
find ~/Downloads -name "*.mp3" -print0 | xargs -0 -I {} mv {} ~/Music/Automatically\ Add\ to\ iTunes/ 
}

extract () {
	if [ -f $1 ] ; then
		case $1 in
			*.tar.bz2) 	tar xjf $1 	;;
			*.tar.gz) 	tar xzf $1 	;;
			*.bz) 		bunzip2 $1 	;;
			*.rar) 		unrar x $1 	;;
			*.gz) 		gunzip $1 	;;
			*.tar) 		tar xf $1 	;;
			*.tbz2) 	tar xjf $1 	;;
			*.tgz) 		tar xzf $1 	;;
			*.zip) 		unzip $1 	;;
			*.Z) 		uncompress $1 	;;
			*) 		echo "'$1' cannot be extracted via extract()" 	;;
		esac
	else
		echo "'$1' is not a valid file"
	fi
}
