" Initialise vim-plug plugin manager
call plug#begin('~/.local/share/nvim/plugged')

" Startify welcome screen
Plug 'mhinz/vim-startify'

" Code completion
Plug 'jiangmiao/auto-pairs'
Plug 'carlitux/deoplete-ternjs'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Editing
Plug 'terryma/vim-multiple-cursors'
Plug 'Yggdroot/indentLine'

" File Navigation
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" File Search
Plug 'ctrlpvim/ctrlp.vim'

" Tag management
Plug 'xolox/vim-easytags'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-shell'

" Formatting
Plug 'stephpy/vim-yaml'
Plug 'godlygeek/tabular'

" Git
Plug 'tpope/vim-fugitive'

" Status Line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'majutsushi/tagbar'
Plug 'airblade/vim-gitgutter'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Themes
Plug 'altercation/vim-colors-solarized'

" Linting
Plug 'w0rp/ale'

" JS Docs
Plug 'heavenshell/vim-jsdoc'

" Code coverage
Plug 'retorillo/istanbul.vim'

" Initialize plugin system
call plug#end()

" *** PLUGIN CONFIG *** "

" Colour scheme
set t_Co=256
syntax on
set background=dark
colorscheme solarized

" Always show line numbers
set number

" Add mouse support
set mouse=a

" Document navigation
set cursorline

" Explore mode layout
let g:netrw_liststyle=3

" Explore list style
let g:netrw_liststyle=3

" When in insert mode CTRL + C will split current line
imap <C-c> <CR><Esc>O

" tagbar
nmap <F8> :TagbarToggle<CR>

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>

" Disbale arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" indent is 4 spaces
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
au FileType javascript set expandtab
au FileType javascript set shiftwidth=4
au FileType javascript set softtabstop=4
au FileType javascript set tabstop=4

"====== Airline ======
set laststatus=2
set ttimeoutlen=50
set noshowmode
let g:airline_theme='badwolf'
let g:airline_powerline_fonts=1

" Make NERDTree show hidden files
let NERDTreeShowHidden=1

let g:startify_lists = [
      \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]

let g:startify_custom_header = [
      \ '        _   __                _              ________  ______',
      \ '       / | / /__  ____ _   __(_)___ ___     /  _/ __ \/ ____/',
      \ '      /  |/ / _ \/ __ \ | / / / __ `__ \    / // / / / __/',
      \ '     / /|  /  __/ /_/ / |/ / / / / / / /  _/ // /_/ / /___',
      \ '    /_/ |_/\___/\____/|___/_/_/ /_/ /_/  /___/_____/_____/',
      \ '',
      \ '',
      \ ]

" Open NERDTree and Startify on start up
autocmd VimEnter *
            \   if !argc()
            \ |   Startify
            \ |   NERDTree
            \ |   wincmd w
            \ | endif

" Use deoplete.
let g:deoplete#enable_at_startup = 1
"
" Disable deoplete when in multi cursor mode to prevent crashes
function! Multiple_cursors_before()
    let b:deoplete_disable_auto_complete = 1
endfunction
function! Multiple_cursors_after()
    let b:deoplete_disable_auto_complete = 0
endfunction

let g:ctrlp_custom_ignore = 'vendor'
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = 'node_modules'

if executable('ag')
    " Use Ag over Grep
    set grepprg=ag\ --nogroup\ --nocolor

    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

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

" Code coverage
let g:istanbul#jsonPath = ['docs/reports/coverage/coverage-final.json']
autocmd CursorHold,CursorHoldI * silent! IstanbulUpdate
set updatetime=1000

" Performance Improvements
set hidden
set history=100

" Make sure this is loaded last

set nocompatible              " be iMproved, required
filetype on                  " required
let mapleader = ","

" Generates Ale documentation tags

" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
