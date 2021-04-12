" Theme
color dracula

set mouse=a

set scrolloff=1

set noshowmode

set backspace=2
set number relativenumber
set clipboard=unnamed

" Tabs
set tabstop=4
set shiftwidth=2
set softtabstop=2
set expandtab

" Search
set hlsearch
set incsearch
set ignorecase
set smartcase

" Splits
set splitbelow
set splitright

let g:dirvish_mode = ':sort ,^.*[\/],'

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldlevelstart=10
