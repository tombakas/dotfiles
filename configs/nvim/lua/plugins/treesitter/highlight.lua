local ts = require("nvim-treesitter")

-- Track parser state across buffers so we don't retry failed installs
-- or re-highlight buffers whose parser is already active.
local parsers_loaded = {}
local parsers_pending = {}
local parsers_failed = {}

local ns = vim.api.nvim_create_namespace("treesitter.async")

-- Activate treesitter for a buffer. Also overrides indentexpr so nvim-treesitter
-- handles indentation instead of the filetype's built-in rules.
local function start(buf, lang)
  local ok = pcall(vim.treesitter.start, buf, lang)
  if ok then
    vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end
  return ok
end

-- The decoration provider fires on every redraw. We use it as an async
-- checkpoint: buffers opened before their parser finished installing are queued
-- in parsers_pending, and drained here once the parser becomes available.
vim.api.nvim_set_decoration_provider(ns, {
  on_start = vim.schedule_wrap(function()
    if #parsers_pending == 0 then
      return false
    end
    for _, data in ipairs(parsers_pending) do
      if vim.api.nvim_buf_is_valid(data.buf) then
        if start(data.buf, data.lang) then
          parsers_loaded[data.lang] = true
        else
          parsers_failed[data.lang] = true
        end
      end
    end
    parsers_pending = {}
  end),
})

local group = vim.api.nvim_create_augroup("TreesitterSetup", { clear = true })

local ignore_filetypes = {
  "checkhealth",
  "lazy",
  "mason",
  "snacks_dashboard",
  "snacks_notif",
  "snacks_win",
}

vim.api.nvim_create_autocmd("FileType", {
  group = group,
  desc = "Enable treesitter highlighting and indentation (non-blocking)",
  callback = function(event)
    if vim.tbl_contains(ignore_filetypes, event.match) then
      return
    end

    local lang = vim.treesitter.language.get_lang(event.match) or event.match
    local buf = event.buf

    if parsers_failed[lang] then
      return
    end

    if parsers_loaded[lang] then
      -- Parser already available: highlight immediately.
      start(buf, lang)
    else
      -- Parser not ready yet (may still be installing): queue for the next redraw.
      table.insert(parsers_pending, { buf = buf, lang = lang })
    end

    -- Kick off install if not already present; no-op if already installed.
    ts.install({ lang })
  end,
})
