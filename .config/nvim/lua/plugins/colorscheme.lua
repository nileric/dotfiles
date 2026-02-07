return {
  {
    "p00f/alabaster.nvim",
    priority = 1000, -- Load before other plugins to avoid highlight conflicts
    config = function()
      vim.opt.termguicolors = true
      vim.cmd("colorscheme alabaster")
    end,
  },
  -- {
  --   "folke/tokyonight.nvim",
  -- },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "alabaster",
    },
  },
}
