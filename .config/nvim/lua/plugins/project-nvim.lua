return {
  "ahmedkhalf/project.nvim",
  config = function()
    require("project_nvim").setup {
      manual_mode = false,
      detection_methods = { "pattern" },
      patterns = { ".git", "Makefile", "package.json" },
    }
  end,
}

