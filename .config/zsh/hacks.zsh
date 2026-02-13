#!/usr/bin/env zsh

# Here are varius useful lifehacks.

# Open buffer line in editor
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line

# Duckduckgo search from terminal
ddg() {
    if [[ -z "$*" ]]; then
        echo "Usage: ddg <search query>"
        return 1
    fi

    # URL-encode the search query
    local query=$(printf '%s' "$*" | sed 's/ /+/g; s/&/%26/g; s/?/%3F/g; s/=/%3D/g')
    local url="https://duckduckgo.com/?q=${query}"

    if [[ "$OSTYPE" == "darwin"* ]]; then
        # macOS
        open -a Firefox "$url"
    else
        # Linux
        firefox --new-tab "$url"
    fi
}
