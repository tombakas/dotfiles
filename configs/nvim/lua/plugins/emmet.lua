filetypes = { "html", "htmldjango", "vue", "scss", "less", "css" }

return {
  "mattn/emmet-vim",

  ft = filetypes,
  config = function()
    vim.g.user_emmet_leader_key = '<c-h>'
    vim.g.user_emmet_install_global = 0

    vim.api.nvim_create_autocmd("FileType", {
        pattern = filetypes,
        callback = function()
          local keymap = vim.keymap.set

          keymap("i", "<c-h>", "<plug>(emmet-expand-abbr)")
          keymap("i", "<c-j>", "<plug>(emmet-move-next)")
          keymap("i", "<c-k>", "<plug>(emmet-move-prev)")
        end,
      })
  end
}
