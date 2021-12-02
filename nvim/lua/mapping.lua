local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = ' '

-- Navigation
keymap('n', '<leader><leader>', '<cmd>lua require("telescope.builtin").buffers()<cr>', opts)
keymap('n', '<c-space>', '<cmd>lua require("telescope.builtin").git_files()<cr>', opts)
keymap('n', '<c-p>', '<cmd>lua require("telescope.builtin").commands()<cr>', opts)
keymap('n', 'ff', '<cmd>lua require("telescope.builtin").live_grep()<cr>', opts)
keymap('n', 'fg', '<cmd>lua require("telescope.builtin").grep_string()<cr>', opts)
keymap('n', 'fs', '<cmd>lua require("telescope.builtin").treesitter()<cr>', opts)
keymap('n', '<leader>q', ':copen<cr>', opts)
keymap('n', '<leader>l', ':lopen<cr>', opts)
keymap('n', '<leader>z', ':ZenMode<cr>', opts)
keymap('n', '[j', '<c-o>', opts)
keymap('n', ']j', '<c-i>', opts)
keymap('n', '<c-j>', '<c-w><c-j>', opts)
keymap('n', '<c-k>', '<c-w><c-k>', opts)
keymap('n', '<c-l>', '<c-w><c-l>', opts)
keymap('n', '<c-h>', '<c-w><c-h>', opts)
