return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "python", "javascript", "css", "scss", "html", "lua", "bash" },

        matchup = {
          enable = true,
        },

        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,

        indent = {
          enable = true,
        },

        highlight = {
          -- `false` will disable the whole extension
          enable = true,

          -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
          -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
          -- Using this option may slow down your editor, and you may see some duplicate highlights.
          -- Instead of true it can also be a list of languages
          additional_vim_regex_highlighting = false,
        },

        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "gnn",
            node_incremental = "<C-k>",
            scope_incremental = "grc",
            node_decremental = "<C-j>",
          },
        },
      })
    end,
  },
  { "nvim-treesitter/nvim-treesitter-context" },
  { "nvim-treesitter/playground" },
}
