# Aliases
alias l.='ls -Gd .*'
alias la='ls -aG'
alias lf='ls -FA'
alias ll='ls -lAG'
alias ls='ls -G'
alias qlook='qlmanage -p "$@" >& /dev/null'
alias t='/opt/local/bin/todotxt'
alias mysql='/opt/local/bin/mysql5'
alias psql='psql -U postgres'

# Until I set apache/mysql query browser/mysql administrator to use the right socket, just symlink between the place they look (/tmp/mysql.sock) and the correct location (in /opt/local).
alias mysql_resock='sudo ln -s /opt/local/var/run/mysql5/mysqld.sock /tmp/mysql.sock'

# For todo script tab completion
source ~/bin/todo_completer.sh
complete -F _todo_sh -o default t

# Multiple history files by shell id
SHELLID=$(tty | sed 's!/!.!g')
HISTFILE=$HISTFILE$SHELLID

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
