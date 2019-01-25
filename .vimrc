" Dependencies

call plug#begin('~/.vim/bundle')

Plug 'editorconfig/editorconfig-vim'

Plug 'dracula/vim', { 'as': 'dracula' }

Plug 'tpope/vim-vinegar'

Plug 'vim-airline/vim-airline'
Plug 'ervandew/supertab'
Plug 'tpope/vim-surround'

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

set backspace=2
set number relativenumber
set clipboard=unnamed

let g:pencil#wrapModeDefault = 'soft'

" Mapping

inoremap <silent> <c-p> <c-\><c-O>:ALEComplete<cr>

"   Navigation

nnoremap <c-p> :GFiles<cr>

"   Buffers

nnoremap <leader>bb :Buffers<cr>
nnoremap <leader>bp :bp<cr>
nnoremap <leader>bn :bn<cr>
nnoremap <leader>bg :e#<cr>

