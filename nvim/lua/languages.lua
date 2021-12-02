local setup_treesitter = require 'treesitter.setup'
local setup_lsp = require 'lsp.setup'

local language_servers = { 'sourcekit', 'tsserver', 'svelte' }
local treesitter_parsers = { 'javascript', 'typescript', 'tsx', 'svelte', 'yaml', 'json', 'html', 'css', 'lua' }

setup_lsp(language_servers)
setup_treesitter(treesitter_parsers)
