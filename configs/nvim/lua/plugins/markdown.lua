return {
  'MeanderingProgrammer/render-markdown.nvim',
  ft = { 'markdown', 'quarto' },
  opts = {
     render_modes = { 'n', 'c', 't' },
    sign = {
        enabled = false,
    },
    heading = {
      icons = {" ", "󰉫 ", "󰉬 ", "󰉭 ", "󰉮 " }
    }
  }
}
