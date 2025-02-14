local function get_lsp_servers()
  local servers = {}
  for _,v in pairs(require("plugins.mason").lsp_servers) do
    servers[v] = {}
  end

  return servers
end

return {
  'neovim/nvim-lspconfig',

  opts = {
    servers = get_lsp_servers()
  },

  config = function(_, opts)
    local keymap = vim.keymap.set

    keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
    keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
  end
}
