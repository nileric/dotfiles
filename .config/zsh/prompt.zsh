#!/usr/bin/env zsh

unset -f command_not_found_handler

fpath+=($ZSHCONFIG/pure)

autoload -U promptinit; promptinit
prompt pure
