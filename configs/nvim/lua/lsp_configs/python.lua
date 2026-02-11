vim.lsp.config["pyright"] = {
  capabilities = (function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.publishDiagnostics.tagSupport.valueSet = { 2 }
    return capabilities
  end)(),
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "off",
      },
    },
  },
}

vim.lsp.config["basedpyright"] = {
  settings = {
    basedpyright = {
      analysis = {

        typeCheckingMode = "standard",
        -- This is the "magic" fix for 'nothing to rename' in many cases
        diagnosticMode = "workspace",
        useLibraryCodeForTypes = true,
        diagnosticSeverityOverrides = {
          reportUnknownVariableType = "none",
          reportUnknownMemberType = "none",
          reportUnknownArgumentType = "none",
          reportIncompatibleVariableOverride = "none",
        },
      },
      exclude = { "**/node_modules", "**/__pycache__" },
    },
  },
}
