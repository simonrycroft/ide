" ====== Airline ======
set laststatus=2
set ttimeoutlen=50
set noshowmode
let g:airline_theme='badwolf'

" ====== CTRL-P ======
let g:ctrlp_custom_ignore = 'vendor'
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_working_path_mode = 'ra'

if executable('ag')
    " Use Ag over Grep
    set grepprg=ag\ --nogroup\ --nocolor

    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" Performance Improvements
set hidden
set history=100

" ====== Deoplete ======
if has('nvim')
    " Enable deoplete on startup
    let g:deoplete#enable_at_startup = 1
endif

" Disable deoplete when in multi cursor mode to prevent crashes
function! Multiple_cursors_before()
    let b:deoplete_disable_auto_complete = 1
endfunction
function! Multiple_cursors_after()
    let b:deoplete_disable_auto_complete = 0
endfunction

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
  endif"

" ====== Livedown ======
let g:livedown_autorun = 1
let g:livedown_browser = 'safari'

" enable vim-vdelve verbose logging
let g:delve_verbose = 1

" Make NERDTree show hidden files
let NERDTreeShowHidden=1

" Open NERDTree and Startify on start up
autocmd VimEnter *
            \   if !argc()
            \ |   Startify
            \ |   NERDTree
            \ |   wincmd w
            \ | endif
