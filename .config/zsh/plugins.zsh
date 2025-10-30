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

ZSH_SUGGEST_DIG="$HOME/.config/zsh"
if [[ -f "$ZSH_SUGGEST_DIG/zsh-autosuggestions/zsh-autosuggestions.zsh" ]]; then
    export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
    export ZSH_AUTOSUGGEST_USE_ASYNC=1
    source "$ZSH_SUGGEST_DIG/zsh-autosuggestions/zsh-autosuggestions.zsh"
fi
