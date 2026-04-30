DOTFILES := $(HOME)/Makefile \
	$(HOME)/.tmux.conf \
	$(HOME)/.zshrc \
	$(HOME)/.config/zsh/ \
	$(HOME)/.config/kanata/ \
	$(HOME)/.config/lazygit/ \
	$(HOME)/.config/kitty/ \
	$(HOME)/.config/nvim/ \
	$(HOME)/.config/ghostty/

KANATA_VESRION := 1.11.0

help:
	@grep -E '^[a-zA-Z0-9._/%-]+:.*?## ' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "  %-25s %s\n", $$1, $$2}'

dots-rescan: ## rescan all files in DOTFILES
	@for f in $(DOTFILES); do \
		yadm add "$$f"; \
	done

dots-submodule-update: ## update all submodules
	yadm submodule update --remote

dots-git: dots-rescan ## enter lazygit
	yadm enter lazygit

macos-upgrade: ## homebrew upgrade
	brew update && brew upgrade

fedora-upgrade: ## dnf upgrade
	sudo dnf upgrade -y
	sudo flatpak update -y

linux-install-kanata: ## install keyboard remapper
	curl -L -o /tmp/kanata.zip https://github.com/jtroo/kanata/releases/download/v$(KANATA_VESRION)/linux-binaries-x64.zip
	unzip /tmp/kanata.zip
	sudo install -m 755 kanata_linux_x64 /usr/local/bin/kanata
	rm /tmp/kanata.zip

.PHONY: help \
	dots-rescan \
	dots-submodule-update \
	dots-git \
	macos-upgrage \
	fedora-upgrade
