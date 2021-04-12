local lspconfig = require 'lspconfig'

require 'lsp.callbacks'
require 'lsp.svelteserver'

local on_attach = function(client, bufnr)
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
end

lspconfig.sourcekit.setup{}
lspconfig.tsserver.setup{ on_attach = on_attach }
lspconfig.svelteserver.setup{ on_attach = on_attach }
