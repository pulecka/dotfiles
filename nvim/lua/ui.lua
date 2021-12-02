vim.cmd 'color dracula'

vim.o.mouse = 'a'
vim.o.scrolloff = 1
vim.o.backspace = '2'
vim.o.clipboard = 'unnamed'

vim.o.hidden = true
vim.o.showmode = false
vim.o.number = true
vim.o.relativenumber = true

-- " Tabs
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 2
vim.o.softtabstop = 2

-- " Search
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

-- " Splits
vim.o.splitbelow = true
vim.o.splitright = true

-- " Folding
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
vim.o.foldlevelstart = 20

vim.g.dirvish_mode = ':sort ,^.*[/],'
