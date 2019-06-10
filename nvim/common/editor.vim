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
