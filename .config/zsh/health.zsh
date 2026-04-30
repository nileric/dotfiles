#!/bin/zsh

health_check() {
    local -a terminal_utils=(
        kitty
        lazygit
        lazydocker
    )

    local -a editors=(
        nvim
    )

    local -a git_tools=(
        git
        delta
    )

    local -a utils=(
        fzf
        zoxide
        shellcheck
    )

    local -a programming_langs=(
        go
        elixir
    )

    local -a others=(
        kanata
        quickemu
    )

    local -a os_specific_utils=()

    if [[ "$OSTYPE" == "darwin"* ]]; then
        os_specific_utils+=(brew)
    elif [[ "$OSTYPE" == "linux-gnu" ]]; then
        os_specific_utils+=(podman)
    fi

    echo "System Health Check\n"

    # Функция для проверки и вывода результата
    check_utils() {
        local category=$1
        shift
        local -a utils=("$@")
        echo "$category"
        for util in "${utils[@]}"; do
            if command -v "$util" &> /dev/null; then
                printf "✓ %-15s installed\n" "$util"
            else
                printf "✖ %-15s not found\n" "$util"
            fi
        done
        echo
    }

    check_utils "Terminal" "${terminal_utils[@]}"
    check_utils "Editors" "${editors[@]}"
    check_utils "Git" "${git_tools[@]}"
    check_utils "Utils" "${utils[@]}"
    check_utils "Programming Languages" "${programming_langs[@]}"
    check_utils "Others" "${others[@]}"
    if (( ${#os_specific_utils[@]} )); then
        check_utils "OS Specific" "${os_specific_utils[@]}"
    fi

    return $(( missing > 0 ? 1 : 0 ))
}

alias health="health_check"
