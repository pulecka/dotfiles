" Remove source control section
let g:airline_section_b=''

" Remove encoding section
let g:airline_section_y=''

" Custom format
let g:airline_section_z='%l/%L : %c'

" Remove separators for empty sections
let g:airline_skip_empty_sections = 1

let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#ale#show_line_numbers = 0
let g:airline#extensions#ale#error_symbol = '✕ '
let g:airline#extensions#ale#warning_symbol = '! '

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#formatter = 'unique_tail'

