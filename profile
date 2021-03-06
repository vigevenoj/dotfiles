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

# Configure bash history
# This doesn't work in a recent osx; just search ~/.bash_sessions
SHELLID=$(tty | sed 's!/!.!g') # Multiple history files by shell id
HISTFILE=$HISTFILE$SHELLID
export HISTCONTROL=ignoredups
export HISTIGNORE="ls:ll:la:l.:lf:pwd:exit:clear"
export EDITOR=vim

if [ -d /opt/local/share/man ]; then
  export MANPATH=/opt/local/share/man:$MANPATH
fi

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
fi

if [ -d /opt/local/lib/postgresl96/bin ]; then
  export PATH=$PATH:/opt/local/lib/postgresql96/bin
  alias postgres_start='sudo /opt/local/etc/LaunchDaemons/org.macports.postgresql96-server/postgresql96-server.wrapper start';
  alias postgres_stop='sudo /opt/local/etc/LaunchDaemons/org.macports.postgresql96-server/postgresql96-server.wrapper stop';
  alias postgres_restart='sudo /opt/local/etc/LaunchDaemons/org.macports.postgresql96-server/postgresql96-server.wrapper restart';
fi  

export PATH=$HOME/bin:$HOME/local/bin:$PATH

# Maven configuration
if [ -d /opt/local/share/java/maven3 ]; then
  export MAVEN_HOME=/opt/local/share/java/maven3
fi
export MAVEN_OPTS="-Xmx2048m -Xms128m"
export ANT_OPTS=$MAVEN_OPTS

# Gradle configuration
if [ -d /opt/local/share/java/gradle ]; then
  export GRADLE_HOME=/opt/local/share/java/gradle
fi

# Go configuration
if [ -d $HOME/code/go ]; then
  export GOPATH=$HOME/code/go
  export GOBIN=$HOME/code/go/bin
fi

# rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# MacPorts Installer addition on 2012-11-19_at_20:02:06: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

# Set up aliases or functions to switch between JDKs
if [ -f /usr/libexec/java_home ]; then
  # We are probably on osx, but no guarantees
  alias j8='export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)'
  alias j9='export JAVA_HOME=$(/usr/libexec/java_home -v 9)'
  alias j10='export JAVA_HOME=$(/usr/libexec/java_home -v 10)'
  alias j11='export JAVA_HOME=$(/usr/libexec/java_home -v 11)'
elif [ -f /sbin/update-alternatives ]; then
  # We are on a debian (or derivative) system
  function j8 () { sudo update-alternatives --set java /usr/lib/jvm/jdk1.8; export $JAVA_HOME=/usr/lib/jvm/jdk1.8_; }
fi
  function j11() { sudo update-alternatives --set java /usr/lib/jvm/jdk11; export $JAVA_HOME /usr/lib/jvm/jdk11; }

function fixwebcam {
  sudo kill $(ps -ef | grep -i "vdcassistant" | grep -v grep | awk '{print $2}')
}

# Move newly-downloaded music into iTunes
function new_music() { 
find ~/Downloads -name "*.mp3" -print0 | xargs -0 -I {} mv {} ~/Music/Automatically\ Add\ to\ iTunes/ 
}

#mkdir, cd into it
function mkcd () {
	mkdir -p "$*"
	cd "$*"
}

export BASH_SILENCE_DEPRECATION_WARNING=1
