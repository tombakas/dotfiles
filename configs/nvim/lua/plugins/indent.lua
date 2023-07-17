return {
  "lukas-reineke/indent-blankline.nvim",

  init = function ()
    vim.g.indent_blankline_filetype_exclude = { "html", "htmldjango", "help", "txt"}
  end,

  opts = {
    show_current_context = true
  }
}
