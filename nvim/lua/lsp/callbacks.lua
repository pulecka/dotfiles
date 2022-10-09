local lsp = vim.lsp
local log = require('vim.lsp.log')
local util = require('vim.lsp.util')
local diagnostic = require('vim.diagnostic')
local lsp_diagnostic = require('vim.lsp.diagnostic')

local methodTitles = {
 ['workspace/symbol'] = 'Workspace Symbols',
 ['textDocument/documentSymbol'] = 'Symbols',
 ['textDocument/references'] = 'References',
 ['textDocument/declaration'] = 'Declarations',
 ['textDocument/definition'] = 'Definitions',
 ['textDocument/typeDefinition'] = 'Type Definitions',
 ['textDocument/implementation'] = 'Implementations'
}

local function symbol_callback(_, result, ctx, config)
  if not result or vim.tbl_isempty(result) then
    vim.notify('No symbols found')
  else
    local title = methodTitles[ctx.method]
    local items = util.symbols_to_items(result, ctx.bufnr)
    vim.fn.setloclist(0, {}, ' ', { title = title, items = items, context = ctx })
    vim.api.nvim_command("lopen")
    vim.api.nvim_command("wincmd p")
  end
end

local function references_callback(_, result, ctx, config)
  if not result or vim.tbl_isempty(result) then
    vim.notify('No references found')
  else
    local client = lsp.get_client_by_id(ctx.client_id)
    local title = methodTitles[ctx.method]
    local items = util.locations_to_items(result, client.offset_encoding)
    vim.fn.setloclist(0, {}, ' ', { title = title, items = items, context = ctx })
    vim.api.nvim_command("lopen")
    vim.api.nvim_command("wincmd p")
  end
end

local function location_callback(_, result, ctx)
  if result == nil or vim.tbl_isempty(result) then
    local _ = log.info() and log.info(ctx.method, 'No location found')
    return nil
  end
  local client = lsp.get_client_by_id(ctx.client_id)

  if vim.tbl_islist(result) then
    local title = methodTitles[ctx.method]
    local items = util.locations_to_items(result, client.offset_encoding)

    if #result > 1 then
      vim.fn.setloclist(0, {}, ' ', { title = title, items = items, context = ctx })
      vim.api.nvim_command("lopen")
      vim.api.nvim_command("wincmd p")
    else
      util.jump_to_location(result[1], client.offset_encoding, true)
    end
  else
    util.jump_to_location(result, client.offset_encoding, true)
  end
end

local function diagnostics_callback(...)
  lsp_diagnostic.on_publish_diagnostics(...)
  diagnostic.setqflist({ open = false })
end

do
  lsp.handlers['textDocument/documentSymbol'] = symbol_callback
  lsp.handlers['workspace/symbol'] = symbol_callback

  lsp.handlers['textDocument/references'] = references_callback

  lsp.handlers['textDocument/declaration'] = location_callback
  lsp.handlers['textDocument/definition'] = location_callback
  lsp.handlers['textDocument/typeDefinition'] = location_callback
  lsp.handlers['textDocument/implementation'] = location_callback

  lsp.handlers['textDocument/publishDiagnostics'] = diagnostics_callback
end
