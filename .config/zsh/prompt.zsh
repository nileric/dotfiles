#!/bin/zsh

unset -f command_not_found_handler 2>/dev/null || true

fpath+=($ZSHCONFIG/pure)

autoload -U promptinit; promptinit
prompt pure
