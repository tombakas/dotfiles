local pickers = {}

pickers.fileTypePicker = function ()
  local filetypes = {}
  for _, ft in ipairs(vim.fn.getcompletion("", "filetype")) do
    table.insert(filetypes, { text = ft, name = ft })
  end

  Snacks.picker({
    items = filetypes,
    source = "filetypes",
    layout = "select",
    format = function(item)
      local icon, icon_hl = require("snacks.util").icon(item.text, "filetype")
      return {
        { icon .. " ", icon_hl },
        { item.text },
      }
    end,
    confirm = function(picker, item)
      picker:close()
      vim.cmd.set("ft=" .. item.text)
    end,
  })
end

return pickers
