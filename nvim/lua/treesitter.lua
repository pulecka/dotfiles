local treesitter = require 'nvim-treesitter.configs'
local treesitter_parsers = require 'nvim-treesitter.parsers'

-- treesitter_parsers.get_parser_configs().typescript = {
--   install_info = {
--     url = "~/Developer/tree-sitter-typescript/typescript",
--     files = { "src/parser.c", "src/scanner.c" },
--   }
-- }

treesitter.setup {
  ensure_installed = { 'javascript', 'typescript', 'tsx', 'yaml', 'json', 'html', 'css', 'lua' },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true
  },
  refactor = {
    highlight_definitions = { enable = true },
  },
}
