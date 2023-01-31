function ZoomToggle()
  if vim.t.zoomed == 1 then
    -- Restore the previous window configuration by executing the stored ex
    -- command.
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

-- Find the closest closing character in insert mode and move right of it
function EscapePair()
  local closers = { ")", "]", "}", ">", "'", '"', "`", "," }
  local line = vim.api.nvim_get_current_line()
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
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
