# If not running interactively don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# Append to the history file
shopt -s histappend

# Setting history length
HISTSIZE=1000
HISTFILESIZE=2000

# Update lines and columns after window size
shopt -s checkwinsize

# Enable programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Add gf auto complete
source ~/.gf/gf-completion.bash

# Add go to path
export PATH=$PATH:/opt/go/bin

# Include aliases
if [ -f $HOME/.aliases ]; then
    . $HOME/.aliases
fi

# Include prompt
if [ -f $HOME/.prompt ]; then
    . $HOME/.prompt
fi

# Include secret
if [ -f $HOME/.secret ]; then
    . $HOME/.secret
fi
