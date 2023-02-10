return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  keys = {
    { "<leader>bt", '<cmd>BufferLinePick<cr>' },
    { "<leader>1", '<cmd>BufferLineGoToBuffer 1<cr>' },
    { "<leader>2", '<cmd>BufferLineGoToBuffer 2<cr>' },
    { "<leader>3", '<cmd>BufferLineGoToBuffer 3<cr>' },
    { "<leader>4", '<cmd>BufferLineGoToBuffer 4<cr>' },
    { "<leader>5", '<cmd>BufferLineGoToBuffer 5<cr>' },
    { "<leader>6", '<cmd>BufferLineGoToBuffer 6<cr>' },
    { "<leader>7", '<cmd>BufferLineGoToBuffer 7<cr>' },
    { "<leader>8", '<cmd>BufferLineGoToBuffer 8<cr>' },
    { "<leader>9", '<cmd>BufferLineGoToBuffer 9<cr>' },
    { '<c-s-l>', '<cmd>BufferLineCycleNext<cr>' },
    { '<c-s-h>', '<cmd>BufferLineCyclePrev<cr>' }
  },
  opts = {
    options = {
      diagnostics = "nvim_lsp",
      always_show_bufferline = false,
      offsets = {
        {
          filetype = "neo-tree",
          text = "Neo-tree",
          highlight = "Directory",
          text_align = "left",
        },
      },
    },
  },
}
