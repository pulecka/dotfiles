local setup_treesitter = require 'treesitter.setup'
local setup_lsp = require 'lsp.setup'

local language_servers = { 'sourcekit', 'tsserver', 'svelte' }
local treesitter_parsers = { 'javascript', 'typescript', 'tsx', 'svelte', 'yaml', 'json', 'html', 'css', 'lua' }

local diagnostic_signs = {
  { name = "DiagnosticSignError", text = "" },
  { name = "DiagnosticSignWarn", text = "" },
  { name = "DiagnosticSignHint", text = "" },
  { name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(diagnostic_signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
end

setup_lsp(language_servers)
setup_treesitter(treesitter_parsers)
