"" Automatic indentation.
filetype indent on

"" Reloads the vim config after saving.
augroup myvimrc
        au!
        au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"" Php autocomplete
" Disable diagnostics
let g:LanguageClient_diagnosticsDisplay = {}
" Deoplete config
"let g:deoplete#auto_complete_start_length=1
"let g:deoplete#omni_patterns = {}
" Required for operations modifying multiple buffers like rename.
set hidden
let g:LanguageClient_serverCommands = {
    \ 'php': ['php', '/home/rob/test/vendor/bin/php-language-server.php'],
    \ }
let g:deoplete#enable_at_startup = 1
""" Key: K                | Action: Hover
""" Key: gd               | Action: go to definition
""" Key: f2               | Action: Rename
nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>

"" Clipboard
set clipboard=unnamedplus

"" Vdebug
let g:vdebug_options= {
  \    "port" : 9000,
  \    "server" : '',
  \    "timeout" : 20,
  \    "on_close" : 'detach',
  \    "break_on_open" : 0,
  \    "ide_key" : '',
  \    "debug_window_level" : 0,
  \    "debug_file_level" : 0,
  \    "debug_file" : "",
  \    "watch_window_style" : 'compact',
  \    "marker_default" : '⬦',
  \    "marker_closed_tree" : '▸',
  \    "marker_open_tree" : '▾',
  \    "path_maps": {"/var/lamp/code/gamesservice": "/Users/sry02/git/services/gaming-service-games"}
  \ }
