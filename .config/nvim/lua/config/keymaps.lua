-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

-- Маппинги для переключения окон
local keymap = vim.keymap

keymap.set("n", "<leader>w<Left>", "<C-w>h", { desc = "Move to the left window" })
keymap.set("n", "<leader>w<Right>", "<C-w>l", { desc = "Move to the right window" })
keymap.set("n", "<leader>w<Up>", "<C-w>k", { desc = "Move to the upper window" })
keymap.set("n", "<leader>w<Down>", "<C-w>j", { desc = "Move to the lower window" })
