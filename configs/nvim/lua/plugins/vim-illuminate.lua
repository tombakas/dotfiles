return {
  "RRethy/vim-illuminate",

  keys = {
    { "<m-n>", function() require('illuminate').goto_next_reference() end },
    { "<m-p>", function() require('illuminate').goto_prev_reference() end }
  },

  event = "BufAdd",

  config = function()
    vim.api.nvim_create_autocmd("ColorScheme", {
      callback = function()
        vim.api.nvim_set_hl(0, 'illuminatedWord', { underline = true })
        vim.api.nvim_set_hl(0, 'illuminatedWordRead', { underline = true })
        vim.api.nvim_set_hl(0, 'illuminatedWordText', { underline = true })
        vim.api.nvim_set_hl(0, 'illuminatedWordWrite', { underline = true })
      end,
    })
  end,
}
