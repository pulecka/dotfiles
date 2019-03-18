" Dependencies

call plug#begin('~/.vim/bundle')

Plug 'dracula/vim', { 'as': 'dracula' }

Plug 'editorconfig/editorconfig-vim'

Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-vinegar'
Plug 'ervandew/supertab'

"   Fuzzy finder
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

"   Text manipulation
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'

"   Language support
Plug 'tpope/vim-git'
Plug 'tpope/vim-markdown'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'w0rp/ale'

"   Writing
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'reedes/vim-pencil'
Plug 'reedes/vim-lexical'

Plug 'jreybert/vimagit'
Plug 'tpope/vim-fugitive'

call plug#end()

" UI

color dracula
syntax on

set mouse=a

set scrolloff=1
set nocompatible

set noshowmode
set ttimeoutlen=10

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
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>

" map <esc> :noh<cr>

inoremap <silent> <c-p> <c-\><c-O>:ALEComplete<cr>

"   Navigation

nnoremap <c-o> :GFiles<cr>
nnoremap <c-p> :Commands<cr>

"   Linting

nnoremap <leader>q :copen<cr>
nnoremap <leader>l :lopen<cr>
nnoremap <leader>f :ALEFix<cr>

"   Buffers

nnoremap <leader><leader> :Buffers<cr>
nnoremap <leader>b :e#<cr>

