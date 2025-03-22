-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

if vim.fn.has("wsl") == 1 then
  vim.opt.clipboard = "unnamedplus"
end
