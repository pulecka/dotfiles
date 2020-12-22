" Dependencies

call plug#begin(stdpath('data') . '/plugged')

" Themes
Plug 'dracula/vim', { 'as': 'dracula' }

" Navigation
Plug 'justinmk/vim-dirvish'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" Editor
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'

Plug 'tpope/vim-dispatch'

" Language support
" Plug 'neovim/nvim-lsp'
" Plug 'nvim-treesitter/nvim-treesitter'
Plug 'tpope/vim-git'
Plug 'tpope/vim-markdown'
Plug 'keith/swift.vim'

" Writing
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'reedes/vim-pencil'

call plug#end()
