local utils = {
  -- Enable lsp servers to draw the nvim-navic winbar
  ["on_attach"] = function(client, bufnr)
    if client.server_capabilities.documentSymbolProvider then
      require("nvim-navic").attach(client, bufnr)
    end
  end
}

return utils
