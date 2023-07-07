return {
  "mattn/emmet-vim",

  ft = { "html", "htmldjango", "vue", "scss", "less", "css" },
  init = function()
    vim.g.user_emmet_install_global = 0
  end,

  config = function ()
    vim.keymap.set("i", "<c-h>", "<c-r>=emmet#util#closePopup()<cr><c-r>=emmet#expandAbbr(0,'')<cr>", {desc="Expand emmet abbreviation"})
    vim.keymap.set({ "i", "n" }, "<m-j>", "<esc>:call emmet#moveNextPrev(0)<cr>", {desc="Emmet go to next edit point"})
    vim.keymap.set({ "i", "n" }, "<m-k>", "<esc>:call emmet#moveNextPrev(1)<cr>", {desc="Emmet go to previous edit point"})
  end
}
