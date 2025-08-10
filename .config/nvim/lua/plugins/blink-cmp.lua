return {
  "saghen/blink.cmp",
  opts = function(_, opts)
    vim.b.completion = true

    Snacks.toggle({
      name = "Completion",
      get = function()
        return vim.b.completion
      end,
      set = function(state)
        vim.b.completion = state
      end,
    }):map("<leader>uk")

    return opts
  end,
}
