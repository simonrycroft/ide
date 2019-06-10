" Auto linting
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 1

" Fix files with prettier, and then ESLint.
let g:ale_fixers = ['prettier', 'eslint', 'remove-trailing_lines', 'trim_whitespace']

" Code completion
let g:deoplete#sources#ternjs#docs = 1

" Don't keep locking up Vim (an issue if the codebase is large)
let g:tern#is_show_argument_hints_enabled = 1
let g:tern_show_signature_in_pum = 1
let g:tern_show_argument_hints = "on_move"

" Map K to lookup docs
autocmd BufReadPost  *.js  nnoremap <buffer> K :TernDoc<CR>

" Snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" CTRL+P
let g:ctrlp_custom_ignore = 'node_modules'

" Code coverage
let g:istanbul#jsonPath = ['docs/reports/coverage/coverage-final.json']
autocmd CursorHold,CursorHoldI * silent! IstanbulUpdate
set updatetime=1000
