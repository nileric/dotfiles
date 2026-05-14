-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

local keymap = vim.keymap

-- Windows movement in Normal Mode
keymap.set("n", "<leader>w<Left>", "<C-w>h", { desc = "Move to the left window" })
keymap.set("n", "<leader>w<Right>", "<C-w>l", { desc = "Move to the right window" })
keymap.set("n", "<leader>w<Up>", "<C-w>k", { desc = "Move to the upper window" })
keymap.set("n", "<leader>w<Down>", "<C-w>j", { desc = "Move to the lower window" })

-- Basic cursor movement in Insert Mode
keymap.set("i", "<C-h>", "<Left>", { desc = "Move left" })
keymap.set("i", "<C-j>", "<Down>", { desc = "Move down" })
keymap.set("i", "<C-k>", "<Up>", { desc = "Move up" })
keymap.set("i", "<C-l>", "<Right>", { desc = "Move right" })

-- Word movement in Insert Mode
keymap.set("i", "<C-b>", "<C-Left>", { desc = "Move word backward" })
keymap.set("i", "<C-w>", "<C-Right>", { desc = "Move word forward" })

-- Line movement in Insert Mode
keymap.set("i", "<C-e>", "<End>", { desc = "Move to line end" })
keymap.set("i", "<C-a>", "<Home>", { desc = "Move to line start" })

-- Delete operations in Insert Mode
keymap.set("i", "<C-d>", "<Delete>", { desc = "Delete forward" })
keymap.set("i", "<C-BS>", "<C-w>", { desc = "Delete word backward" })

-- Other useful Insert Mode mappings
keymap.set("i", "<C-u>", "<C-g>u<C-u>", { desc = "Delete to start of line" })
keymap.set("i", "<C-y>", "<Esc>pa", { desc = "Paste in insert mode" })

-- Wayfinder
keymap.set("n", "<leader>wf", "<Plug>(WayfinderOpen)", { desc = "Wayfinder" })

-- nvim-spider
vim.keymap.set({ "n", "o", "x" }, "w", "<cmd>lua require('spider').motion('w')<CR>")
vim.keymap.set({ "n", "o", "x" }, "e", "<cmd>lua require('spider').motion('e')<CR>")
vim.keymap.set({ "n", "o", "x" }, "b", "<cmd>lua require('spider').motion('b')<CR>")
vim.keymap.set({ "n", "o", "x" }, "ge", "<cmd>lua require('spider').motion('ge')<CR>")
