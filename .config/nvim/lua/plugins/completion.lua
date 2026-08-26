return {
  "saghen/blink.cmp",
  opts = {
    keymap = {
      preset = "default",

      -- Использование Enter только для переноса строки, ЕСЛИ элемент не выбран вручную
      ["<CR>"] = { "accept", "fallback" },

      -- Ручной вызов/закрытие всплывающего окна
      ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
      ["<C-e>"] = { "hide" },

      -- Навигация с помощью Tab / Shift+Tab или Ctrl+N / Ctrl+P
      ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
      ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
    },
    completion = {
      list = {
        selection = {
          preselect = false,
          auto_insert = false,
        },
      },
      trigger = {
        show_in_snippet = false,
      },

      documentation = {
        auto_show = true,
        auto_show_delay_ms = 500,
      },
    },
  },
}
