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
