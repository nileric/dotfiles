#!/bin/zsh

if command -v fzf &> /dev/null; then
  eval "$(fzf --zsh)"
fi

if command -v zoxide &> /dev/null; then
    function z () {
      __zoxide_z "$@"
    }
    compdef z="_z"
    eval "$(zoxide init --cmd cd zsh)"
fi

function yy() {
	local tmp cwd; tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd" || builtin true
	command rm -f -- "$tmp"
}

if [[ -f "$ZSHCONFIG/zsh-autosuggestions/zsh-autosuggestions.zsh" ]]; then
    export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
    export ZSH_AUTOSUGGEST_USE_ASYNC=1
    source "$ZSHCONFIG/zsh-autosuggestions/zsh-autosuggestions.zsh"
fi
