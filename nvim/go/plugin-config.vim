" Manage imports on save
let g:go_fmt_command = "goimports"

" Save file automatically when runing/building/testing/compiling
set autowrite

" run metalinter on save
let g:go_metalinter_autosave = 1

" Error and warning signs.
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'

" Enable integration with airline.
let g:airline#extensions#ale#enabled = 1

" indents
au FileType go set noexpandtab
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set tabstop=4

" Better syntax highlighting
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_structs = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_auto_sameids = 1
let g:go_auto_type_info = 1

" quickfix shortcuts
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
noremap <leader>a :cclose<CR>

" run, test, test function, test compile, coverage toggle
autocmd FileType go nmap <leader>r <Plug>(go-run)
autocmd FileType go nmap <leader>t <Plug>(go-test)
autocmd FileType go nmap <leader>f <Plug>(go-test-func)
autocmd FileType go nmap <leader>c <Plug>(go-coverage-toggle)

" Run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

" make all lists quickfix type
let g:go_list_type = "quickfix"

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<Right>"
let g:UltiSnipsJumpBackwardTrigger = "<Left>"

" Make it easier to open alternate files
autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

" View func definitions within the same package
au FileType go nmap <leader>gt :GoDeclsDir<cr>

" Auto add JSON tags to structs
let g:go_addtags_transform = "camelcase"

"Go snippet engine
let g:go_snippet_engine = "neosnippet"

" Delve Debugger

" Connect to debug server
map <F5> :DlvConnect localhost:2345 apiVersion=2<CR>
" Start test debugging in current package
map <F6> :DlvTest<CR>
" Toggle Breakpoint
map <F10> :DlvToggleBreakpoint<CR>

