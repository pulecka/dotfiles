local treesitter = require 'nvim-treesitter.configs'

local setup_treesitter = function(parsers)
  treesitter.setup {
    ensure_installed = parsers,
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
end

return setup_treesitter

