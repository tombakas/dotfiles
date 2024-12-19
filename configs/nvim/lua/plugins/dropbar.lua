return {
  "Bekaboo/dropbar.nvim",

  enabled = true,
  event = "BufNew",
  keys = {
      {
        "<leader>d",
        function()
          require("dropbar.api").pick()
        end,
        desc = "Pick from dropbar context",
      },
  },
  opts = {
    hover = false,
    sources = {
      treesitter = {
        valid_types = {
          'array',
          'boolean',
          'break_statement',
          'call',
          'case_statement',
          'class',
          'constant',
          'constructor',
          'continue_statement',
          'delete',
          'do_statement',
          'element',
          'enum',
          'enum_member',
          'event',
          'for_statement',
          'function',
          'h1_marker',
          'h2_marker',
          'h3_marker',
          'h4_marker',
          'h5_marker',
          'h6_marker',
          'if_statement',
          'interface',
          'keyword',
          'macro',
          'method',
          'namespace',
          'null',
          'number',
          'operator',
          'package',
          'pair',
          'property',
          'reference',
          'repeat',
          'rule_set',
          'scope',
          'specifier',
          'struct',
          'switch_statement',
          'type',
          'type_parameter',
          'unit',
          'value',
          'variable',
          'while_statement',
          'declaration',
          'field',
          'identifier',
          'object',
          'statement',
        }
      }
    },
    bar = {
      hover = true,
      sources = function(buf, _)
        local sources = require("dropbar.sources")
        local utils = require("dropbar.utils")

        if vim.bo[buf].ft == "markdown" then
          return {
            sources.markdown,
          }
        end

        if vim.bo[buf].buftype == "terminal" then
          return {
            sources.terminal,
          }
        end

        return {
          -- sources.path,
          utils.source.fallback({
            -- sources.lsp,
            sources.treesitter,
          }),
        }
      end,
    },
  },
}
