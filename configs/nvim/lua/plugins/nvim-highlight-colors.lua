return {
  "brenoprata10/nvim-highlight-colors",
  lazy = true,

  config = function()
    require("nvim-highlight-colors").setup({})

    vim.api.nvim_create_autocmd({ "BufEnter" }, {
      callback = function()
        local enabled_filetypes = { "css", "scss", "less" }

        if vim.tbl_contains(enabled_filetypes, vim.bo.filetype) then
          require("nvim-highlight-colors").turnOn()
        else
          require("nvim-highlight-colors").turnOff()
        end
      end,
    })
  end,
}
