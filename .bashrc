[ -f $HOME/.bash_aliases ] && source $HOME/.bash_aliases || echo "$HOME/.bash_aliases not found"
#LIBRARY_PATH=/usr/lib/x86_64-linux-gnu:/usr/lib32:$LIBRARY_PATH 
#export LIBRARY_PATH

# BASH prompt
if [ ! `whoami` = root ]; then
    PS1='\[\033[01;30m\]\t `if [ $? = 0 ]; then echo "\[\033[01;32m\]ツ"; else echo "\[\033[01;31m\]✗ "; fi` \[\033[00;32m\]\h\[\033[00;37m\]:\[\033[31m\]$(__git_ps1 "(%s)\[\033[01m\]")\[\033[00;34m\]\w\[\033[00m\] > '
else
    PS1="\[\033[31m\]\u@\H\[\033[1;32m\]:\[\033[34m\] \w\[\033[m\]\[\033[33m\] #>\[\033[37m\] "
fi

# GCC 4.8
if [ -d "$HOME/env/gcc-4.8.0" ] ; then
    PATH="$HOME/env/gcc-4.8.0/bin:$PATH"
    LD_LIBRARY_PATH="$HOME/env/gcc-4.8.0/lib:$LD_LIBRARY_PATH"
fi

# CMAKE
if [ -d "$HOME/env/cmake" ] ; then
    PATH="$HOME/env/cmake/bin:$PATH"
fi

# CXX Flag
if [ -d "$HOME/env/gcc-4.8.0/bin" ] ; then
    CXX="$HOME/env/gcc-4.8.0/bin/g++:$CXX"
fi

# leJOS intallation directory
if [ -d "/opt/leJOS_NXJ" ] ; then
    NXJ_HOME="/opt/leJOS_NXJ"
    PATH="$NXJ_HOME/bin:$PATH"
fi

# Local binaries (for new tools, like VIM)
if [ -d "/opt/local/bin" ]; then
    PATH="/opt/local/bin:$PATH"
fi

SSH_ENV="$HOME/.ssh/environment"

function start_agent {
    echo "Initialising new SSH agent..."
        /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
        echo succeeded
        chmod 600 "${SSH_ENV}"
        . "${SSH_ENV}" > /dev/null
        /usr/bin/ssh-add;
}

# Source SSH settings, if applicable

if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" > /dev/null
    #ps ${SSH_AGENT_PID} doesn't work under cywgin
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi

[ -f $HOME/.germs/germs/infect.sh ] && source $HOME/germs/germs/infect.sh || echo "$HOME/germs/germs/infect.sh not found"
[ -f $HOME/.germs/germs/cure.sh ] && source $HOME/germs/germs/cure.sh || echo "$HOME/germs/germs/cure.sh not found"
