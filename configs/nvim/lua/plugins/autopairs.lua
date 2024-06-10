return {
  "windwp/nvim-autopairs",
  config = function()
    local npairs = require("nvim-autopairs")
    local Rule = require("nvim-autopairs.rule")

    npairs.setup({
      map_cr = true,
      ignored_next_char = "", --string.gsub([[ [%w%%%'%[%"%.] ]],"%s+", "")
      fast_wrap = {
        map = "<M-e>",
        chars = { "{", "[", "(", '"', "'" },
        pattern = [=[[%'%"%>%]%)%}%,]]=],
        end_key = "$",
        keys = "qwertyuiopzxcvbnmasdfghjkl",
        check_comma = true,
        highlight = "Search",
        highlight_grey = "Comment",
      },
    })

    npairs.add_rules({
      Rule(" ", " "):with_pair(function(opts)
        local pair = opts.line:sub(opts.col - 1, opts.col)
        return vim.tbl_contains({ "()", "[]", "{}" }, pair)
      end),
      Rule("( ", " )")
        :with_pair(function()
          return false
        end)
        :with_move(function(opts)
          return opts.prev_char:match(".%)") ~= nil
        end)
        :use_key(")"),
      Rule("{ ", " }")
        :with_pair(function()
          return false
        end)
        :with_move(function(opts)
          return opts.prev_char:match(".%}") ~= nil
        end)
        :use_key("}"),
      Rule("[ ", " ]")
        :with_pair(function()
          return false
        end)
        :with_move(function(opts)
          return opts.prev_char:match(".%]") ~= nil
        end)
        :use_key("]"),
      Rule("``", "`", "rst"),
      Rule("<", ">", { "html", "htmldjango", "c", "cpp" })
        :with_move(function(opts)
          return opts.char == ">"
        end)
    })
  end,
}
