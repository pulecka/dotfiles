call plug#begin('~/.vim/bundle')

Plug 'sickill/vim-monokai'

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'octref/RootIgnore'

Plug 'ervandew/supertab'
Plug 'tpope/vim-surround'

Plug 'sheerun/vim-polyglot'

Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'reedes/vim-pencil'

call plug#end()

syntax on

colo monokai

set backspace=2

let g:NERDTreeQuitOnOpen = 1
let NERDTreeRespectWildIgnore=1
let NERDTreeShowHidden=1

let g:pencil#wrapModeDefault = 'soft'   " default is 'hard'

noremap <C-n> :NERDTreeToggle<CR>

augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  autocmd FileType text         call pencil#init()
augroup END

function! s:goyo_enter()
  let b:quitting = 0
  let b:quitting_bang = 0
  autocmd QuitPre <buffer> let b:quitting = 1
  cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
  Limelight
endfunction
		     
function! s:goyo_leave()
  " Quit Vim if this is the only remaining buffer
  if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
    if b:quitting_bang
      qa!
    else
      qa
    endif
  endif
  Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

au Filetype markdown Goyo 80x90%
 
