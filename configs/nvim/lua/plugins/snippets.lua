return {
  "L3MON4D3/LuaSnip",

  dependencies = {
    "rafamadriz/friendly-snippets",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },

  build = "make install_jsregexp",
  opts = {
    history = true,
    delete_check_events = "TextChanged",
  },

  -- stylua: ignore
  keys = {
    { "<c-j>",
      function()
        if require("luasnip").expand_or_jumpable() then
          require("luasnip").jump(1)
        end
      end,
      mode = {"i", "s"}
    },
    { "<c-k>", function() require("luasnip").jump(-1) end, mode = { "i", "s" } },
  }
}
