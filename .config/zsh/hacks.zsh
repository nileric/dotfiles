#!/bin/zsh

# Here are varius useful lifehacks.

# Open buffer line in editor
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line

# wrapper that provides the ability to change the current working directory when exitin Yazi
# https://yazi-rs.github.io/docs/quick-start#shell-wrapper
function yy() {
	local tmp cwd; tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd" || builtin true
	command rm -f -- "$tmp"
}
