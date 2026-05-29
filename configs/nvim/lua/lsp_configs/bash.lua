vim.lsp.config["bashls"] = {
  handlers = {
    ["textDocument/publishDiagnostics"] = function(err, result, ctx, config)
      if result then
        local file_name = vim.fn.fnamemodify(vim.uri_to_fname(result.uri), ":t")
        if file_name:match("^%.env") then return end
      end
      vim.lsp.handlers["textDocument/publishDiagnostics"](err, result, ctx, config)
    end,
  },
}
