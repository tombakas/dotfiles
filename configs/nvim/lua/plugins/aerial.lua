return {
  "stevearc/aerial.nvim",

  opts = {
    -- optionally use on_attach to set keymaps when aerial has attached to a buffer
    disable_max_lines = 20000,
    backends = { "treesitter", "lsp" },
    on_attach = function(bufnr)
      -- Jump forwards/backwards with '{' and '}'
      vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>', {buffer = bufnr})
      vim.keymap.set('n', '}', '<cmd>AerialNext<CR>', {buffer = bufnr})
    end

  },
  keys = {
    { "<leader>o", "<cmd>AerialToggle!<CR>" },
  }
}
