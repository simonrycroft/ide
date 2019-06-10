" Auto formatting
let g:ale_fixers = {'javascript': ['eslint']}

" indents
au FileType javascript set noexpandtab
au FileType javascript set shiftwidth=2
au FileType javascript set softtabstop=2
au FileType javascript set tabstop=2

" ,f to format file
autocmd FileType javascript nmap <leader>f <Plug>(ale_fix)

" linters used for JavaScript.
let g:ale_linters = {'javascript': ['eslint']}
highlight clear ALEErrorSign " otherwise uses error bg color (typically red)
highlight clear ALEWarningSign " otherwise uses error bg color (typically red)
let g:ale_sign_error = 'X' " could use emoji
let g:ale_sign_warning = '?' " could use emoji
let g:ale_statusline_format = ['X %d', '? %d', '']
" %linter% is the name of the linter that provided the message
" %s is the error or warning message
let g:ale_echo_msg_format = '%linter% says %s'
" Map keys to navigate between lines with errors and warnings.
nnoremap <leader>an :ALENextWrap<cr>
nnoremap <leader>ap :ALEPreviousWrap<cr>

" Don't search these dirs
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
