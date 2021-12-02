local lspconfig = require 'lspconfig'
require 'lsp.callbacks'

local on_attach = function(client, bufnr)
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
  local opts = { noremap = true, silent = true }

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
  buf_set_keymap('n', 'ga', '<cmd>lua require("telescope.builtin").lsp_code_actions()<cr>', opts)
  buf_set_keymap('n', 'fr', '<cmd>lua require("telescope.builtin").lsp_references()<cr>', opts)
  buf_set_keymap('n', 'frr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
  buf_set_keymap('n', 'fd', '<cmd>lua require("telescope.builtin").lsp_document_symbols()<cr>', opts)
  buf_set_keymap('n', 'fdd', '<cmd>lua vim.lsp.buf.document_symbol()<cr>', opts)
  buf_set_keymap('n', 'fw', '<cmd>lua require("telescope.builtin").lsp_dynamic_workspace_symbols()<cr>', opts)
  buf_set_keymap('n', 'fww', '<cmd>lua vim.lsp.buf.workspace_symbol()<cr>', opts)
end

local setup_lsp = function(servers)
  for _, server in ipairs(servers) do
    lspconfig[server].setup {
      on_attach = on_attach,
    }
  end
end

return setup_lsp

