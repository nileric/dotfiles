#!/bin/zsh

dot-re-add-all() {
  local -a to_add=(
    ~/.tmux.conf
    ~/.zshrc
    ~/.config/zsh/
    ~/.config/kanata/
    ~/.config/lazygit/
    ~/.config/kitty/
    ~/.config/nvim/
  )

  for f in "${to_add[@]}"; do 
    yadm add "$f"
  done
}
