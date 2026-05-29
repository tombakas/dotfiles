vim.lsp.config["basedpyright"] = {
  settings = {
    basedpyright = {
      analysis = {
        typeCheckingMode = "standard",
        -- diagnosticMode = "workspace" fixes 'nothing to rename' in many cases
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
