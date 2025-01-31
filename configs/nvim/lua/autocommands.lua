-- Remove trailing whitespace on save
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

vim.api.nvim_create_autocmd({ "BufReadPost" }, {
  pattern = { "*" },
  callback = function()
    if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
      vim.api.nvim_exec("normal! g'\"", false)
    end
  end,
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = {
    "*.html",
  },
  callback = function()
    vim.bo.filetype = "htmldjango"
  end,
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = {
    "*.html",
  },
  callback = function()
    vim.bo.filetype = "htmldjango"
  end,
})

vim.api.nvim_create_autocmd({ "BufEnter" }, {
  callback = function()
    local supported_filetypes = { "python", "javascript", "lua" }
    local no_change_filetypes = { "", "aerial", "neotree", "neo-tree" }
    local disable_filetypes = { "Trouble" }

    if vim.tbl_contains(supported_filetypes, vim.bo.filetype) then
      vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
      require('treesitter-context').disable()
    elseif not vim.tbl_contains(no_change_filetypes, vim.bo.filetype) then
      vim.o.winbar = nil
      if not vim.o.diff then
        pcall(require('treesitter-context').enable)
      end
    elseif vim.tbl_contains(disable_filetypes, vim.bo.filetype) then
      vim.o.winbar = nil
    end
  end,
})

vim.api.nvim_create_autocmd({ "BufEnter" }, {
  callback = function()
    if vim.bo.buftype == "terminal" and vim.api.nvim_get_mode()["mode"] == "nt" then
      vim.cmd("startinsert")
    end
  end,
})
