#!/bin/zsh

os_upgrade() {
  if [[ "$OSTYPE" == "darwin"* ]]; then
    brew update && brew upgrade
  elif [[ "$OSTYPE" == "linux-gnu" ]]; then
    sudo dnf upgrade -y
    sudo flatpak update -y
  fi
}

alias os-upgrade="os_upgrade"
