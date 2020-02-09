" Plugins
source ~/.config/nvim/plug.vim

" UI
source ~/.config/nvim/ui.vim

" LSP
luafile ~/.config/nvim/lua/lsp.lua

" Mapping

let mapleader="\<Space>"

"   Disable arrow keys
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>

"   Buffers
nnoremap <leader><leader> :Buffers<cr>
nnoremap <leader>b :e#<cr>

"    LSP
nnoremap <silent> gd	<cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
