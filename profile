# Global aliases
alias l.='ls -Gd .*'
alias la='ls -aG'
alias lf='ls -FA'
alias ll='ls -lAG'
alias ls='ls -G'
alias ping='ping -c 4'
# Databases
#alias mysql='/opt/local/bin/mysql5'
alias psql='psql -U postgres'
# OS X specific
alias qlook='qlmanage -p "$@" >& /dev/null'

alias hpjmeter='java -jar ~/tools/hpjmeter.jar > /dev/null 2>&1 &'
alias tda='java -jar ~/tools/tda-bin-2.2/tda.jar > /dev/null 2>&1 &'


# Configure bash history
SHELLID=$(tty | sed 's!/!.!g') # Multiple history files by shell id
HISTFILE=$HISTFILE$SHELLID
export HISTCONTROL=ignoredups
export HISTIGNORE="ls:ll:la:l.:lf:pwd:exit:clear"

if [ -d /opt/local/share/man ]; then
  export MANPATH=/opt/local/share/man:$MANPATH
fi
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
    # ant isn't installed on all the machines?
    #complete -C /usr/share/java/ant-1.7.1/bin/complete-ant-cmd.pl ant
fi

if [ -d /Library/PostgreSQL/9.2/bin ]; then
  export PATH=$PATH:/Library/PostgreSQL/9.2/bin
fi

# Move newly-downloaded music into iTunes
function new_music() { 
find ~/Downloads -name "*.mp3" -print0 | xargs -0 -I {} mv {} ~/Music/Automatically\ Add\ to\ iTunes/ 
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

# Android configuration
if [ -d $HOME/tools/android-sdk-macosx/tools ]; then
  export PATH=$HOME/tools/android-sdk-macosx/tools:$HOME/tools/android-skd-macosx/platform-tools:$PATH
  export ANDROID_HOME=$HOME/tools/android-sdk-macosx
  export ANDROID_SDK_HOME=$HOME/tools/android-sdk-macosx
fi

# Maven configuration
if [ -d /opt/local/share/java/maven3 ]; then
  export MAVEN_HOME=/opt/local/share/java/maven3
fi
export MAVEN_OPTS="-Xmx2048m -Xms128m -XX:+UseConcMarkSweepGC -XX:+UseParNewGC"
export ANT_OPTS=$MAVEN_OPTS

# rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# MacPorts Installer addition on 2012-11-19_at_20:02:06: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

# Set up aliases or functions to switch between JDKs
if [ -f /usr/libexec/java_home ]; then
  # We are probably on osx, but no guarantees
  alias j6='export JAVA_HOME=$(/usr/libexec/java_home -v 1.6*)'
  alias j7='export JAVA_HOME=$(/usr/libexec/java_home -v 1.7*)'
  alias j8='export JAVA_HOME=$(/usr/libexec/java_home -v 1.8.0_40)'
elif [ -f /sbin/update-alternatives ]; then
  # We are on a debian (or derivative) system
  function j6 () { sudo update-alternatives --set java /usr/lib/jvm/jdk1.6; export $JAVA_HOME=/usr/lib/jvm/jdk1.6_; }
  function j7 () { sudo update-alternatives --set java /usr/lib/jvm/jdk1.7; export $JAVA_HOME=/usr/lib/jvm/jdk1.7_; }
  function j8 () { sudo update-alternatives --set java /usr/lib/jvm/jdk1.8; export $JAVA_HOME=/usr/lib/jvm/jdk1.8_; }
fi
