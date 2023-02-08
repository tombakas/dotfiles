-- Remove trailing whitespace on save
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
}
)

vim.api.nvim_create_autocmd({ "BufReadPost" }, {
  pattern = { "*" },
  callback = function()
    if (vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$")) then
      vim.api.nvim_exec("normal! g'\"", false)
    end
  end
}
)

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = {
    "*.html",
  },
  callback = function()
    vim.bo.filetype = "htmldjango"
  end,
})
