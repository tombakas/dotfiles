return {
  {
    'echasnovski/mini.ai',
    version = false,
    config = function()
      require('mini.ai').setup({
        search_method = 'cover_or_nearest',
        n_lines = 2000
      })
    end
  },
}
