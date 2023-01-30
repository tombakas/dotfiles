return {
  "majutsushi/tagbar",
  config = function()
    local keymap = vim.keymap.set

    vim.g.tagbar_width = 40
    vim.g.tagbar_type_yaml = {
      ctagstype = 'yaml',
      kinds = { 
        'p:property:1:0',
        'e:endpoint:1:0',
        'd:definition:1:0',
      },
    }

    vim.g.tagbar_type_javascript = {
      ctagstype = 'javascript',
      kinds =  {
        'f:functions',
        'c:constants',
      }
    }

    keymap("n", "<F3>", "<cmd>Tagbar<cr>")

    vim.api.nvim_create_autocmd({ "FileType" }, {
      pattern = { "yaml" },
      callback = function()
        vim.g.tagbar_width = 70
      end,
    })
  end
}
