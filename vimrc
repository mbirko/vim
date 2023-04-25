" guttentags  

" line numbering set
set nu
set rnu

" search realted set
set hlsearch		" search high liging
set incsearch		" incremental search high ligting
set ic			" ignore case, removes case senitity when searching

" formatiing set
set nowrap
set colorcolumn=100

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

syntax on

" Packs! 
if v:version >= 800
"    packadd! nerdtree
    packadd! vim-dirdiff
    packadd! vim-gutentags
    packadd! termdebug
endif

" Keyboard mappings! 
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l 
map <C-_> <C-w>_

function! ApplyNetrwMaps()
    nmap <buffer> <c-l> <c-w>l
endfunction

augroup netrw_maps
    autocmd!
    autocmd filetype netrw call ApplyNetrwMaps()
augroup END



" disapling search highling between searches by hitting space
nnoremap <space> :nohlsearch<bar>:echo<cr>

" Enable omnicomple 
set omnifunc=syntaxcomplete#complete
" auto completion

set dictionary+=./dict/python

set complete+=k

