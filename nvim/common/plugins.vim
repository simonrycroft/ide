" Initialise vim-plug plugin manager
call plug#begin('~/.local/share/nvim/plugged')

" Enable vimball
packadd vimball

" Welcome screen
Plug 'mhinz/vim-startify'

" Autocomplete
Plug 'jiangmiao/auto-pairs'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Editing
Plug 'terryma/vim-multiple-cursors'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'Yggdroot/indentLine'

" File Navigation
Plug 'yonchu/accelerated-smooth-scroll'
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" File Search
Plug 'ctrlpvim/ctrlp.vim'

" Formatting
Plug 'stephpy/vim-yaml'
Plug 'godlygeek/tabular'

" Git
Plug 'tpope/vim-fugitive'

" Linting
Plug 'bronson/vim-trailing-whitespace'

" Miscellaneous
Plug 'shime/vim-livedown'
Plug 'xolox/vim-misc'
Plug 'tpope/vim-eunuch'

" Status Line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'majutsushi/tagbar'
Plug 'airblade/vim-gitgutter'

" Syntax Highlighting
Plug 'Valloric/MatchTagAlways'

" Themes
Plug 'altercation/vim-colors-solarized'

" Local vim-vdelve plugin under development
Plug '/Users/sry02/git/innovation/vim/plugins/vim-vdelve'

" Fonts for NERDTree glyphs
Plug 'ryanoasis/vim-devicons'

