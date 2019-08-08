#!/usr/bin/env bash
stty -ixon # Disable ctrl-s and ctrl-q.
shopt -s autocd #Allows you to cd into directory merely by typing the directory name.
HISTCONTROL=ignoreboth # don't put duplicate lines or lines starting with space in the history.
HISTSIZE=HISTFILESIZE=-1 # for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
export VISUAL=nvim
export EDITOR=$VISUAL
alias vim="nvim"
alias vi="nvim"
alias v="nvim"
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc" # Load custom aliases
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
