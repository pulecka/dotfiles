local lspconfig = require 'lspconfig'

require 'lsp.callbacks'
require 'lsp.svelteserver'

lspconfig.sourcekit.setup{}
lspconfig.tsserver.setup{}
lspconfig.svelteserver.setup{}
