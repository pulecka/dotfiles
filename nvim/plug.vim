" Dependencies

call plug#begin(stdpath('data') . '/plugged')

" Themes
Plug 'dracula/vim', { 'as': 'dracula' }

" Navigation
Plug 'tpope/vim-vinegar'

" Fuzzy finder
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" Editor
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'

" Language support
Plug 'tpope/vim-git'
Plug 'tpope/vim-markdown'
Plug 'pangloss/vim-javascript'
Plug 'neovim/nvim-lsp'

" Writing
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'reedes/vim-pencil'

call plug#end()
