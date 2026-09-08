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

pickers.changedFilePicker = function()
  -- Find the root of the current Git repository.
  local root = Snacks.git.get_root()
  if not root then
    vim.notify("Not inside a git repository", vim.log.levels.ERROR)
    return
  end

  -- Get files that differ from the master branch.
  -- Exclude deleted files since they can't be opened or previewed.
  local files = vim.fn.systemlist({
    "git",
    "-C",
    root,
    "diff",
    "master",
    "--name-only",
    "--diff-filter=ACMR",
  })

  -- Abort if the Git command failed.
  if vim.v.shell_error ~= 0 then
    vim.notify("Failed to get changed files", vim.log.levels.ERROR)
    return
  end

  -- Convert file paths into Snacks picker items.
  local items = {}
  for i, file in ipairs(files) do
    items[#items + 1] = {
      idx = i,
      file = file,
      text = file,
    }
  end

  -- Show changed files in a picker with file previews.
  Snacks.picker({
    title = "Diff master",
    cwd = root,
    items = items,
    format = "file",
    preview = "file",
  })
end

return pickers
