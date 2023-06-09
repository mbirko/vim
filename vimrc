" line numbering set
set nu
set rnu

" search related set
set hlsearch		" search high lighting
set incsearch		" incremental search high lighting
set ic			" ignore case, removes case sensitivity when searching

" formatting set
set nowrap
set colorcolumn=80

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

" :term Keyboard mappings!
tnoremap <C-j> <C-w>j
tnoremap <C-k> <C-w>k
tnoremap <C-h> <C-w>h
tnoremap <C-l> <C-w>l

" disapling search highling between searches by hitting space
nnoremap <space> :nohlsearch<bar>:echo<cr>

" function! CleverTab()
"    if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
"       return "\<Tab>"
"    else
"       return "\<C-N>"
"    endif
" endfunction
" inoremap <Tab> <C-R>=CleverTab()<CR>

" Autosave setup:
augroup autosave
    autocmd!
    autocmd BufRead, 8 if &filletype == "" | setlocal ft=text | endif
    autocmd FileType * autocmd TextChanged,insertLeave <buffer>
        \ if &readonly == 0
        \ && &filetype !=# "qf"
        \ && &filetype !=# "netrw"
        \ | silent write | endif
augroup end


" Packs! 
filetype plugin indent on
if v:version >= 800
"    packadd! ale
"    packadd! nerdtree
    packadd! vim-dirdiff
    packadd! vim-gutentags
    packadd! termdebug
    packadd! vimtex
        let g:tex_flavor='latex'
        let g:vimtex_view_method='zathura'
        let g:vimtex_quickfix_mode=0
    packadd! ultisnips
        let g:UltisnipsSnippetDirectories=[$HOME."/.vim/UltiSnips"]
        let g:UltiSnipsExpandTrigger = '<tab>'
        let g:UltiSnipsJumpForwardTrigger = '<tab>'
        let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
endif

" Netrw 
" Opens Netrw on the left with a size of 30 when '-' is pressed
map - :Lexplore<cr>:vertical resize 30<cr>


" Enable omnicomple 
set omnifunc=syntaxcomplete#complete
" auto completion
set completeopt=longest,menuone
set dictionary+=./dict/python
set complete+=k

" Easy update of vimrc
nmap <Leader>s :source $MYVIMRC<cr>
nmap <Leader>v :e $MYVIMRC<cr>

