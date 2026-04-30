#!/bin/zsh

export EDITOR='nvim'
export KUBE_EDITOR='nvim'

export PAGER='less'
export LESS='-i -R -F -X -M'

# PATH
path=(
  $HOME/bin
  $HOME/.local/bin
  $path
)

# Go
export GOPATH="$HOME/go"
path+=(
  $GOPATH/bin
  /usr/local/go/bin
)

if [[ "$OSTYPE" == "darwin"* ]]; then
  if [[ "$(uname -m)" == "arm64" ]]; then
    path=(/opt/homebrew/bin /opt/homebrew/sbin $path)
  else
    path=(/usr/local/bin /usr/local/sbin $path)
  fi

  if command -v brew &> /dev/null; then
    eval "$(brew shellenv)"
  fi
  export HOMEBREW_NO_ENV_HINTS=1
  export HOMEBREW_NO_AUTO_UPDATE=1
  export HOMEBREW_NO_ANALYTICS=1

  export XDG_CONFIG_HOME="$HOME/.config"
fi

export PATH
