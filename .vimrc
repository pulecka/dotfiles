" Dependencies

call plug#begin('~/.vim/bundle')

Plug 'editorconfig/editorconfig-vim'

Plug 'dracula/vim', { 'as': 'dracula' }

Plug 'tpope/vim-vinegar'

Plug 'vim-airline/vim-airline'
Plug 'ervandew/supertab'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

Plug 'sheerun/vim-polyglot'
Plug 'w0rp/ale'

Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'reedes/vim-pencil'

Plug 'jreybert/vimagit'

call plug#end()

" UI

color dracula
syntax on

set scrolloff=1
set nocompatible

set encoding=utf8
set termencoding=utf8

set backspace=2
set number relativenumber
set clipboard=unnamed

" Search
set hlsearch
set incsearch
set ignorecase
set smartcase

" Mapping

"   Disable arrow keys
" noremap <up> <nop>
" noremap <down> <nop>
" noremap <left> <nop>
" noremap <right> <nop>

" map <esc> :noh<cr>

inoremap <silent> <c-p> <c-\><c-O>:ALEComplete<cr>

"   Navigation

nnoremap <c-o> :GFiles<cr>
nnoremap <c-p> :Commands<cr>

"   Buffers

nnoremap <leader>B :Buffers<cr>
nnoremap <leader>b :e#<cr>

