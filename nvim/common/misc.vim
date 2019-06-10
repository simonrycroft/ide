" Make sure this file is loaded last

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

" Open the word under the cursor on the Jenkins plugin docs
nmap <leader>j :call JenkinsPluginDocs()<CR>
fun! JenkinsPluginDocs()
    let keyword = expand("<cword>")
    echomsg keyword
    let url = "http://www.google.com/search?btnI=1&q=wiki.jenkins.io+" . keyword
    let open="open '" . url . "'"
    let blah = system(open)
endfun

fun! ToggleCommentBlock()
    " move cursor to beginning of line
    if matchstr(getline('.'), '\%' . col('.') . 'c.') == "/"
        " uncomment comments
        normal <S-V><S-$><S-%><C-V><H><X>
    else
        " comment out
        normal V$%\<c+v>
        call append(line('^'), "//")
    endif
endfun

" With cursor on opening brace will comment to closing brace
nmap <leader>/ <S-V><S-$><S-%><C-V><S-I>//<ESC>
nmap <CTRL-/> :call ToggleCommentBlock()<CR>
