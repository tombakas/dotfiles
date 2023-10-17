return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",

  config = function()
    require("ibl").setup({
      exclude = { filetypes = { "html", "htmldjango", "help", "txt" } },
      scope = { enabled = true }
    })
  end,
}
