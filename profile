# Aliases
alias l.='ls -Gd .*'
alias la='ls -aG'
alias lf='ls -FA'
alias ll='ls -lAG'
alias ls='ls -G'
alias ping='ping -c 4'
# Databases
alias mysql='/opt/local/bin/mysql5'
alias psql='psql -U postgres'
# OS X specific
alias qlook='qlmanage -p "$@" >& /dev/null'


# Configure bash history
SHELLID=$(tty | sed 's!/!.!g') # Multiple history files by shell id
HISTFILE=$HISTFILE$SHELLID
export HISTCONTROL=ignoredups
export HISTIGNORE="ls:ll:la:l.:lf:pwd:exit:clear"

export MANPATH=/opt/local/share/man:$MANPATH
export EDITOR=vim

# For todo script tab completion
if [ -f ~/bin/todo_completer.sh ]; then
	source ~/bin/todo_completer.sh
	complete -F _todo_sh -o default t
fi

# MacPorts
# Bash Completion from macports
if [ -f /opt/local/etc/bash_completion ]; then
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
    . /opt/local/etc/bash_completion
    complete -C /usr/share/java/ant-1.7.1/bin/complete-ant-cmd.pl ant
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

#mkdir, cd into it
function mkcd () {
	mkdir -p "$*"
	cd "$*"
}

function mysql_resock() {
	if [ -S /tmp/mysql.sock ]; then
		echo "/tmp/mysql.sock already exists"
	else
		sudo ln -s /opt/local/var/run/mysql5/mysqld.sock /tmp/mysql.sock
	fi
}	

export PATH=$HOME/bin:$HOME/local/bin:$PATH

# Maven configuration
export MAVEN_HOME=/usr/share/maven
export MAVEN_OPTS="-Xmx2048m -Xms128m -XX:+UseConcMarkSweepGC -XX:+UseParNewGC"
export ANT_OPTS=$MAVEN_OPTS


# rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

##
# Your previous /Users/vigevenoj/.bash_profile file was backed up as /Users/vigevenoj/.bash_profile.macports-saved_2012-11-19_at_20:02:06
##

# MacPorts Installer addition on 2012-11-19_at_20:02:06: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

