DOTFILES := $(HOME)/Makefile \
	$(HOME)/.tmux.conf \
	$(HOME)/.zshrc \
	$(HOME)/.config/zsh/ \
	$(HOME)/.config/kanata/ \
	$(HOME)/.config/lazygit/ \
	$(HOME)/.config/kitty/ \
	$(HOME)/.config/nvim/ \
	$(HOME)/.config/ghostty/

dotfiles-rescan:
	@for f in $(DOTFILES); do \
		yadm add "$$f"; \
	done

dotfiles-update-submodule:
	yadm submodule update --remote

dotfiles-git:
	yadm enter lazygit

.PHONY: help \
	dotfiles-rescan \
	dotfiles-update-submodule \
	dotfiles-git
