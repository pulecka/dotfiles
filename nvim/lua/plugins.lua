local Plug = vim.fn['plug#']
local install_path = vim.fn.stdpath "data" .. "/plugged"

vim.call('plug#begin', install_path)

-- Themes
Plug('dracula/vim', { as = 'dracula' })
Plug 'arcticicestudio/nord-vim'

-- Navigation
Plug 'justinmk/vim-dirvish'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

-- Editor
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'

-- Source control
Plug 'tpope/vim-fugitive'

-- Language support
Plug 'neovim/nvim-lsp'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'tpope/vim-git'
Plug 'tpope/vim-markdown'

-- Writing
Plug 'folke/zen-mode.nvim'
Plug 'folke/twilight.nvim'
Plug 'reedes/vim-pencil'

vim.call('plug#end')

