#!/bin/zsh

ZSHCONFIG="$HOME/.config/zsh"

# remove duplicates from path
typeset -U path

[[ -f "$ZSHCONFIG/history.zsh" ]] && source "$ZSHCONFIG/history.zsh"
[[ -f "$ZSHCONFIG/completion.zsh" ]] && source "$ZSHCONFIG/completion.zsh"
[[ -f "$ZSHCONFIG/env.zsh" ]] && source "$ZSHCONFIG/env.zsh"
[[ -f "$ZSHCONFIG/aliases.zsh" ]] && source "$ZSHCONFIG/aliases.zsh"
[[ -f "$ZSHCONFIG/plugins.zsh" ]] && source "$ZSHCONFIG/plugins.zsh"
[[ -f "$ZSHCONFIG/prompt.zsh" ]] && source "$ZSHCONFIG/prompt.zsh"
[[ -f "$ZSHCONFIG/health.zsh" ]] && source "$ZSHCONFIG/health.zsh"
[[ -f "$ZSHCONFIG/hacks.zsh" ]] && source "$ZSHCONFIG/hacks.zsh"
[[ -f "$ZSHCONFIG/local.zsh" ]] && source "$ZSHCONFIG/local.zsh"
