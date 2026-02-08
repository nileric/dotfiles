#!/usr/bin/env zsh

alias vim='nvim'
alias tnv='NVIM_APPNAME=nvim_test nvim'

alias lzg='lazygit'
alias lzd='lazydocker'

alias dots-rescan="make -f $HOME/Makefile dots-rescan"
alias dots-git="make -f $HOME/Makefile dots-git"

if [[ "$OSTYPE" == "darwin"* ]]; then
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
