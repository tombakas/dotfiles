return {
  "RRethy/vim-illuminate",

  config = function()
    local illuminate = require('illuminate')

    illuminate.configure()
    vim.keymap.set("n", "<m-n>", function() illuminate.goto_next_reference() end)
    vim.keymap.set("n", "<m-p>", function() illuminate.goto_prev_reference() end)

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
