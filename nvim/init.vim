" Plugins
source ~/.config/nvim/plug.vim

" UI
source ~/.config/nvim/ui.vim

" Writing
source ~/.config/nvim/writing.vim

" LSP
" luafile ~/.config/nvim/lua/lsp.lua

" Treesitter
" luafile ~/.config/nvim/lua/treesitter.lua

" Mapping
let mapleader="\<Space>"

"   Disable arrow keys
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>

"   Navigation
nnoremap <leader><leader> :Buffers<cr>
nnoremap <leader>b :e#<cr>
nnoremap <c-space> :GFiles<cr>
nnoremap <c-p> :Commands<cr>
nnoremap <leader>q :copen<cr>
nnoremap <leader>l :lopen<cr>
nnoremap <leader>z :Goyo<cr>
nnoremap [j <c-o>
nnoremap ]j <c-i>
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-l> <c-w><c-l>
nnoremap <c-h> <c-w><c-h>

"   LSP
" nnoremap <silent> gd	<cmd>lua vim.lsp.buf.definition()<CR>
" nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
" nnoremap <silent> gD    <cmd>lua vim.lsp.buf.type_definition()<CR>
" nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
" nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
" nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>

au! BufNewFile,BufRead *.svelte set ft=html.svelte
