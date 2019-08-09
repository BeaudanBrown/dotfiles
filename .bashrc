#!/usr/bin/env bash
stty -ixon # Disable ctrl-s and ctrl-q.
shopt -s autocd #Allows you to cd into directory merely by typing the directory name.
HISTCONTROL=ignoreboth # don't put duplicate lines or lines starting with space in the history.
HISTSIZE=HISTFILESIZE=-1 # for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
export VISUAL=nvim
export EDITOR=$VISUAL
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc" # Load custom aliases
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Simple colour terminal for now
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# Nice bash autocomplete
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
