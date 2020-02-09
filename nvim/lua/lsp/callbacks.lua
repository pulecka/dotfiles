-- local configs = require 'nvim_lsp/configs'
-- local util = require 'nvim_lsp/util'
-- local protocol = require 'vim.lsp.protocol'
local lsp = vim.lsp

do
  local method = 'textDocument/documentSymbol'
  local default_callback = lsp.callbacks[method]
  -- local function _symbols_to_items(_symbols, _items, _bufnr)
  --   local _items = {}
  --   for _, symbol in ipairs(_symbols) do
  --     if symbol.location then -- SymbolInformation type
  --       local range = symbol.location.range
  --       local kind = protocol.SymbolKind[symbol.kind]
  --       table.insert(_items, '['..kind..'] '..symbol.name)
  --     elseif symbol.range then -- DocumentSymbole type
  --       local kind = protocol.SymbolKind[symbol.kind]
  --       table.insert(_items, '['..kind..'] '..symbol.name)
  --     end
  --   end
  --   return _items
  -- end
  lsp.callbacks[method] = function(_, _, result, _, bufnr)
    if not result or vim.tbl_isempty(result) then return end
    -- local document_symbols = _symbols_to_items(result, bufnr)
    local document_symbols = lsp.util.symbols_to_items(result, bufnr)
    lsp.util.set_loclist(document_symbols)
    -- local fzf_config = {
    --     source = document_symbols
    --     sink = 'v:lua.MyLuaSink',
    --     options = "+m --with-nth 2.. -d ::"
    -- }
    -- vim.fn['fzf#run'](vim.fn['fzf#wrap'](fzf_config))
    vim.api.nvim_command("lopen")
    vim.api.nvim_command("wincmd p")
  end
end

