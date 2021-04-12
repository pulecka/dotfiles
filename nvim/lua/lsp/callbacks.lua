-- local protocol = require 'vim.lsp.protocol'
local lsp = vim.lsp
local log = require('vim.lsp.log')

-- local function symbols_to_source(symbols)
--   local items = {}
--   for _, symbol in ipairs(symbols) do
--     if symbol.location then -- SymbolInformation type
--       local range = symbol.location.range
--       local kind = protocol.SymbolKind[symbol.kind]
--       table.insert(items, '['..kind..'] '..symbol.name)
--     elseif symbol.range then -- DocumentSymbole type
--       local kind = protocol.SymbolKind[symbol.kind]
--       table.insert(items, '['..kind..'] '..symbol.name)
--     end
--   end
--   return items
-- end

local function symbol_callback(_, _, result, _, bufnr)
  if result == nil or vim.tbl_isempty(result) then
    local _ = log.info() and log.info(method, 'No symbol found')
    return nil
  end

  local symbols = lsp.util.symbols_to_items(result, bufnr)
  lsp.util.set_loclist(symbols)
  -- local fzf_config = {
  --     source = document_symbols
  --     sink = 'v:lua.MyLuaSink',
  --     options = "+m --with-nth 2.. -d ::"
  -- }
  -- vim.fn['fzf#run'](vim.fn['fzf#wrap'](fzf_config))
  vim.api.nvim_command("lopen")
  vim.api.nvim_command("wincmd p")
end

local function references_callback(_, _, result)
  if result == nil or vim.tbl_isempty(result) then
    local _ = log.info() and log.info(method, 'No references found')
    return nil
  end

  lsp.util.set_loclist(lsp.util.locations_to_items(result))
  vim.api.nvim_command("lopen")
  vim.api.nvim_command("wincmd p")
end

local function location_callback(_, method, result)
  if result == nil or vim.tbl_isempty(result) then
    local _ = log.info() and log.info(method, 'No location found')
    return nil
  end

  -- textDocument/definition can return Location or Location[]
  -- https://microsoft.github.io/language-server-protocol/specifications/specification-current/#textDocument_definition

  if vim.tbl_islist(result) then
    lsp.util.jump_to_location(result[1])

    if #result > 1 then
      lsp.util.set_loclist(util.locations_to_items(result))
      api.nvim_command("lopen")
      api.nvim_command("wincmd p")
    end
  else
    lsp.util.jump_to_location(result)
  end
end

do
  lsp.handlers['textDocument/documentSymbol'] = symbol_callback
  lsp.handlers['workspace/symbol'] = symbol_callback

  lsp.handlers['textDocument/references'] = references_callback

  lsp.handlers['textDocument/declaration'] = location_callback
  lsp.handlers['textDocument/definition'] = location_callback
  lsp.handlers['textDocument/typeDefinition'] = location_callback
  lsp.handlers['textDocument/implementation'] = location_callback
end
