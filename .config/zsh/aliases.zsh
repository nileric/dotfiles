#!/usr/bin/env zsh

alias vim='nvim'
alias tnv='NVIM_APPNAME=nvim_test nvim'

alias lzg='lazygit'
alias lzd='lazydocker'

if [[ "$OSTYPE" == "darwin"* ]];
  alias os-upgrade="make -f $HOME/Makefile macos-upgrade"
fi
if [[ "$OSTYPE" == "linux-gnu" ]]; then
  alias os-upgrade="make -f $HOME/Makefile fedora-upgrade"
fi
