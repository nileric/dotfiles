DOTFILES := $(HOME)/Makefile \
	$(HOME)/.tmux.conf \
	$(HOME)/.zshrc \
	$(HOME)/.config/zsh/ \
	$(HOME)/.config/kanata/ \
	$(HOME)/.config/lazygit/ \
	$(HOME)/.config/kitty/ \
	$(HOME)/.config/nvim/ \
	$(HOME)/.config/ghostty/

dots-rescan:
	@for f in $(DOTFILES); do \
		yadm add "$$f"; \
	done

dots-submodule-update:
	yadm submodule update --remote

dots-git:
	yadm enter lazygit

macos-upgrade:
	brew update && brew upgrade

fedora-upgrade:
	sudo dnf upgrade -y
	sudo flatpak update -y

.PHONY: help \
	dots-rescan \
	dots-submodule-update \
	dots-git \
	macos-upgrage \
	fedora-upgrade
