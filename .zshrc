HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

autoload -Uz compinit
compinit

alias vim='nvim'
alias lzg='lazygit'
alias lzd='lazydocker'

# macOS Specific Configurations
if [[ "$OSTYPE" == "darwin"* ]]; then
    # Homebrew
    export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"

    # Python
    export PATH="/opt/homebrew/opt/python@3.8/libexec/bin:$PATH"

    # OpenSSL
    export PATH="/opt/homebrew/opt/openssl@3/lib/pkgconfig:$PATH"
    export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl@3/lib/pkgconfig"

    # PostgreSQL
    export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

    # Node.js
    export NODE_OPTIONS=--openssl-legacy-provider

    # change config default path
    export XDG_CONFIG_HOME="$HOME/.config"
fi

# linux Specific Configuration
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    export PATH=$PATH:/home/nileric/bin
 
    #podman
    # https://github.com/jesseduffield/lazydocker/issues/4#issuecomment-2618979105
    export DOCKER_HOST="unix:///run/user/1000/podman/podman.sock"
    alias docker='podman'

    # bluetooth
    alias blue-start='systemctl start bluetooth.service'
    alias blue-stop='systemctl stop bluetooth.service'
fi

export PATH="$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH"

# Go
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:/usr/local/go/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"

# Editors
export EDITOR="nvim"
export KUBE_EDITOR="nvim"

export GPG_TTY=$(tty)

# zoxide
if [ -x "$(which zoxide)" ];
then
    function z () {
      __zoxide_z $@
    }
    compdef z="_z"

    eval "$(zoxide init --cmd cd zsh)"
fi

if [[ -f ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
    source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
fi
