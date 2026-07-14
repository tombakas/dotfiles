local M = {}

function M.ZoomToggle()
  if vim.t.zoomed == 1 then
    -- Restore the previous window configuration by executing the stored ex command.
    vim.api.nvim_command(vim.t.zoom_winrestcmd)
    vim.t.zoomed = nil
  else
    -- Store current configuration of windows as a command that can be called
    -- to restore the configuration.
    vim.t.zoom_winrestcmd = vim.fn.winrestcmd()
    vim.api.nvim_win_set_width(0, vim.o.columns + 1)
    vim.api.nvim_win_set_height(0, vim.o.lines + 1)
    vim.t.zoomed = 1
  end
end

function M.EscapePair()
  local closers = { ")", "]", "}", ">", "'", '"', "`", "," }
  local line = vim.api.nvim_get_current_line()
  local row, col = table.unpack(vim.api.nvim_win_get_cursor(0))
  local after = line:sub(col + 1, -1)
  local closer_col = #after + 1
  local closer_i = nil
  for i, closer in ipairs(closers) do
    local cur_index, _ = after:find(closer)
    if cur_index and (cur_index < closer_col) then
      closer_col = cur_index
      closer_i = i
    end
  end
  if closer_i then
    vim.api.nvim_win_set_cursor(0, { row, col + closer_col })
  else
    vim.api.nvim_win_set_cursor(0, { row, col + 1 })
  end
end

function M.LspLocationList(options)
  local seen = {}
  local items = {}

  for _, item in ipairs(options.items) do
    local key = table.concat({
      vim.fs.normalize(item.filename or ""),
      item.lnum or "",
      item.col or "",
      item.end_lnum or "",
      item.end_col or "",
    }, ":")

    if not seen[key] then
      seen[key] = true
      table.insert(items, item)
    end
  end

  if #items == 0 then
    vim.notify("No locations found", vim.log.levels.INFO)
    return
  end

  vim.fn.setqflist({}, " ", {
    title = options.title,
    items = items,
    context = options.context,
  })

  if #items == 1 then
    vim.cmd("cfirst")
  else
    vim.cmd("copen")
  end
end

return M
