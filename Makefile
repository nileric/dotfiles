DOTFILES := $(HOME)/Makefile \
	$(HOME)/.tmux.conf \
	$(HOME)/.zshrc \
	$(HOME)/.config/zsh/ \
	$(HOME)/.config/kanata/ \
	$(HOME)/.config/lazygit/ \
	$(HOME)/.config/kitty/ \
	$(HOME)/.config/nvim/ \
	$(HOME)/.config/ghostty/

KANATA_VESRION ?= 1.11.0
NVIM_VERSION ?= 0.12.2

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
	@printf '\n'
	sudo flatpak update -y

linux-install-kanata: ## install keyboard remapper (linux)
	curl -L -o /tmp/kanata.zip https://github.com/jtroo/kanata/releases/download/v$(KANATA_VESRION)/linux-binaries-x64.zip
	unzip /tmp/kanata.zip
	sudo install -m 755 kanata_linux_x64 /usr/local/bin/kanata
	rm /tmp/kanata.zip

linux-install-nvim: ## install nvim (linux)
	curl -L -o /tmp/nvim.tar.gz https://github.com/neovim/neovim/releases/download/v$(NVIM_VERSION)/nvim-linux-x86_64.tar.gz
	sudo rm -rf /opt/nvim-linux-x86_64
	sudo tar -C /opt -xzf /tmp/nvim.tar.gz
	rm /tmp/nvim.tar.gz

.PHONY: help \
	dots-rescan \
	dots-submodule-update \
	dots-git \
	macos-upgrage \
	fedora-upgrade
