#!/bin/zsh

ZSHCONFIG="$HOME/.config/zsh"

[[ -f "$ZSHCONFIG/history.zsh" ]] && source "$ZSHCONFIG/history.zsh"
[[ -f "$ZSHCONFIG/completion.zsh" ]] && source "$ZSHCONFIG/completion.zsh"
[[ -f "$ZSHCONFIG/env.zsh" ]] && source "$ZSHCONFIG/env.zsh"
[[ -f "$ZSHCONFIG/aliases.zsh" ]] && source "$ZSHCONFIG/aliases.zsh"
[[ -f "$ZSHCONFIG/plugins.zsh" ]] && source "$ZSHCONFIG/plugins.zsh"
[[ -f "$ZSHCONFIG/prompt.zsh" ]] && source "$ZSHCONFIG/prompt.zsh"
[[ -f "$ZSHCONFIG/health.zsh" ]] && source "$ZSHCONFIG/health.zsh"
[[ -f "$ZSHCONFIG/system.zsh" ]] && source "$ZSHCONFIG/system.zsh"
[[ -f "$ZSHCONFIG/dotfiles.zsh" ]] && source "$ZSHCONFIG/dotfiles.zsh"
