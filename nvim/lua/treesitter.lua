local nvim_treesitter = require 'nvim-treesitter.configs'

nvim_treesitter.setup {
  ensure_installed = { 'markdown', 'javascript', 'typescript', 'tsx', 'yaml', 'json', 'html', 'css', 'lua' },
  highlight = {
    enable = true,
  },
  refactor = {
    highlight_definitions = { enable = true },
  },
}
