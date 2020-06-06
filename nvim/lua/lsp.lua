local nvim_lsp = require 'nvim_lsp'

require 'lsp.callbacks'
require 'lsp.svelteserver'

nvim_lsp.tsserver.setup{}
nvim_lsp.svelteserver.setup{}
