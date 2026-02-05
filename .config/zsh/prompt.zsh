#!/usr/bin/env zsh

fpath+=($ZSHCONFIG/pure)

autoload -U promptinit; promptinit
prompt pure
