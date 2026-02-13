#!/usr/bin/env zsh

autoload -Uz compinit

if [[ "$OSTYPE" == "darwin"* ]]; then
  if [ "$(date +'%j')" != "$(stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)" ]; then
    compinit
  else
    compinit -C
  fi
elif [[ "$OSTYPE" == "linux-gnu" ]]; then
  if [[ -n ~/.zcompdump(#qN.mh+24) ]]; then
    compinit
  else
    compinit -C
  fi
fi

if command -v kubectl &>/dev/null; then
  # lazy-load kubectl completion on first use
  _kubectl_completion_lazy() {
    # drop loader and load real completion
    unfunction _kubectl_completion_lazy 2>/dev/null
    source <(kubectl completion zsh)
  }

  # attach lazy loader to kubectl completion
  compdef _kubectl_completion_lazy kubectl
fi

if command -v docker &>/dev/null; then
  # lazy-load docker completion on first use
  _docker_completion_lazy() {
    # drop loader and load real completion
    unfunction _docker_completion_lazy 2>/dev/null
    source <(docker completion zsh)
  }

  # attach lazy loader to docker completion
  compdef _docker_completion_lazy docker
fi

