vim.o.termguicolors = true
vim.cmd 'colorscheme nord'

local nordColors = vim.fn.NordPalette()

local function nord_highlight(name, fg, bg)
  vim.cmd(string.format("highlight %s guifg=%s  guibg=%s", name, nordColors[fg], nordColors[bg]))
end

nord_highlight('Status', 'nord4', 'nord1')
nord_highlight('StatusNormal', 'nord0', 'nord4')
nord_highlight('StatusInsert', 'nord0', 'nord8')
nord_highlight('StatusVisual', 'nord0', 'nord13')
nord_highlight('StatusCommand', 'nord0', 'nord15')

-- Dim cursor line when leaving window.
local group = vim.api.nvim_create_augroup("ActiveWindow", { clear = true })  
vim.api.nvim_create_autocmd("WinEnter", { command = "setlocal winhighlight=", group = group })
vim.api.nvim_create_autocmd('WinLeave', { command = "setlocal winhighlight=CursorLine:Normal,CursorLineNR:LineNR", group = group })
