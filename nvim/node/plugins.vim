" Syntax hihlighting
Plug 'pangloss/vim-javascript'
Plug 'digitaltoad/vim-pug'
Plug 'othree/html5.vim'

" Code completion
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'ternjs/tern_for_vim'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Linting
Plug 'w0rp/ale'

" JS Docs
Plug 'heavenshell/vim-jsdoc'

" Code coverage
Plug 'retorillo/istanbul.vim'

" Initialize plugin system
call plug#end()
