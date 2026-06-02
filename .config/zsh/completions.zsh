#!/bin/zsh

autoload -Uz compinit

if [[ "$OSTYPE" == darwin* ]]; then
  ZSH_CACHE_DIR="${XDG_CACHE_HOME:-$HOME/Library/Caches}/zsh"
else
  ZSH_CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/zsh"
fi

mkdir -p "$ZSH_CACHE_DIR/completions"

ZCOMPDUMP="$ZSH_CACHE_DIR/zcompdump-${ZSH_VERSION}"

# Rebuild compdump if older than 24h.
if [[ -n "$ZCOMPDUMP"(#qN.mh+24) ]]; then
  compinit -d "$ZCOMPDUMP"
else
  compinit -C -d "$ZCOMPDUMP"
fi

if command -v kubectl &>/dev/null; then
  KUBECTL_COMPLETION="$ZSH_CACHE_DIR/completions/kubectl_completion"

  if [[ ! -f "$KUBECTL_COMPLETION" || "$(command -v kubectl)" -nt "$KUBECTL_COMPLETION" ]]; then
    kubectl completion zsh >| "$KUBECTL_COMPLETION"
  fi

  source "$KUBECTL_COMPLETION"
fi

if command -v docker &>/dev/null; then
  DOCKER_COMPLETION="$ZSH_CACHE_DIR/completions/docker_completion"

  if [[ ! -f "$DOCKER_COMPLETION" || "$(command -v docker)" -nt "$DOCKER_COMPLETION" ]]; then
    docker completion zsh >| "$DOCKER_COMPLETION"
  fi

  source "$DOCKER_COMPLETION"
fi
