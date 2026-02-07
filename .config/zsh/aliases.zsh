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

if [[ "$OSTYPE" == "linux-gnu" ]]; then
  export DOCKER_HOST="unix:///run/user/1000/podman/podman.sock"
  alias docker='podman'
  alias blue-start='systemctl start bluetooth.service'
  alias blue-stop='systemctl stop bluetooth.service'
fi
