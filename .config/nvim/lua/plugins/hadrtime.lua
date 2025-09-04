if true then
  return {}
end

return {
  "m4xshen/hardtime.nvim",
  lazy = false,
  dependencies = { "MunifTanjim/nui.nvim" },
  opts = {
    disabled_mouse = false,
    restriction_mode = "hint",
    disabled_keys = {
      ["<Up>"] = false,
      ["<Down>"] = false,
      ["<Left>"] = false,
      ["<Right>"] = false,
    },
  },
}
