#!/bin/zsh
if [[ "$OSTYPE" == darwin* ]]; then
  ZSH_CACHE_DIR="${XDG_CACHE_HOME:-$HOME/Library/Caches}/zsh"
else
  ZSH_CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/zsh"
fi
mkdir -p "$ZSH_CACHE_DIR/completions"

# generate completion files BEFORE compinit. like _kubectl in fpath
if command -v kubectl &>/dev/null; then
  KCOMP="$ZSH_CACHE_DIR/completions/_kubectl"
  if [[ ! -f "$KCOMP" || "$(command -v kubectl)" -nt "$KCOMP" ]]; then
    kubectl completion zsh >| "$KCOMP"
  fi
fi

if command -v docker &>/dev/null; then
  DCOMP="$ZSH_CACHE_DIR/completions/_docker"
  if [[ ! -f "$DCOMP" || "$(command -v docker)" -nt "$DCOMP" ]]; then
    docker completion zsh >| "$DCOMP" 2>/dev/null
  fi
fi

# add to fpath BEFORE compinit
fpath=("$ZSH_CACHE_DIR/completions" $fpath)

autoload -Uz compinit
ZCOMPDUMP="$ZSH_CACHE_DIR/zcompdump-${ZSH_VERSION}"
if [[ -n "$ZCOMPDUMP"(#qN.mh+24) ]]; then
  compinit -d "$ZCOMPDUMP"
else
  compinit -C -d "$ZCOMPDUMP"
fi

