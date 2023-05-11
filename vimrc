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

" No swap file
set noswapfile

" Keyboard mappings! 
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-h> <C-w>h
noremap <C-l> <C-w>l 
map <C-_> <C-w>_

" Keyboard mappings! 
tnoremap <C-j> <C-w>j
tnoremap <C-k> <C-w>k
tnoremap <C-h> <C-w>h
tnoremap <C-l> <C-w>l 

" Autosave setup: 
augroup autosave
    autocmd!
    autocmd BufRead, 8 if &filletype == "" | setlocal ft=text | endif
    autocmd FileType * autocmd TextChanged,insertLeave <buffer> if &readonly == 0 | silent write | endif
augroup end


" Packs! 
if v:version >= 800
"    packadd! ale
"    packadd! nerdtree
    packadd! vim-dirdiff
    packadd! vim-gutentags
    packadd! termdebug
endif

" Netrw 

" Opens Netrw on the left with a size of 30 when '-' is pressed
map - :Lexplore<cr>:vertical resize 30<cr>

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

