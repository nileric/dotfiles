return {
  "TheLeoP/refactoring.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  init = function()
    -- Прокси для require("async") на require("plenary.async")
    package.preload["async"] = function()
      return require("plenary.async")
    end
  end,
  config = function()
    require("refactoring").setup()
  end,
}
