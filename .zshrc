# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp 
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/opt/local/bin:/opt/local/bin:/opt/local/bin:/opt/local/bin:/opt/local/bin:/opt/local/bin:/opt/local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games"
# export MANPATH="/usr/local/man:$MANPATH"

# # Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# history stuff
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt append_history
setopt hist_expire_dups_first
setopt hist_ignore_space
setopt inc_append_history
setopt share_history

# fix zsh annoying history behavior
h() { if [ -z "$*" ]; then history 1; else history 1 | egrep "$@"; fi; }

autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '\eOA' up-line-or-beginning-search
bindkey '\e[A' up-line-or-beginning-search
bindkey '\eOB' down-line-or-beginning-search
bindkey '\e[B' down-line-or-beginning-search
###############################################################################
# Aliases
###############################################################################
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
source $HOME/.aliases

###############################################################################
# Functions
###############################################################################
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
    export NXJ_HOME="/opt/leJOS_NXJ"
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

# Handle solarize theme mainly for VIM
if [ -e /lib/terminfo/x/xterm-256color ]; then
    export TERM='xterm-256color'
else
    export TERM='xterm-color'
fi

if [ -f $HOME/.Xdefaults ]; then
    xrdb -merge $HOME/.Xdefaults
fi

~/solarize.sh dark
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export PROTOBUF_DIR=/home/parapampa/dev/orwell/protobuf-2.5.0
export JEROMQ_DIR=/home/parapampa/dev/orwell/jeromq
export JUNIT_DIR=/home/parapampa/dev/orwell/junit
export HAMCREST_DIR=/home/parapampa/dev/orwell/hamcrest-core

export GIT_EDITOR=vim
export VISUAL=vim
export EDITOR=vim
