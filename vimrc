set backspace=eol,start,indent
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

function! CleverTab()
   if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
      return "\<Tab>"
   else
      return "\<C-N>"
   endif
endfunction
inoremap <Tab> <C-R>=CleverTab()<CR>

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
if v:version >= 800
    packadd! ale
    let g:ale_completion_enabled=1
    let g:ale_sign_column_always=1
    let g:ale_linters = {
    \  'scala': ['metals'],
    \  'python': ['pyright'],
    \}
    let g:ale_fixers = {
    \  'scala': ['scalafmt','trim_whitespace', 'remove_trailing_lines'],
    \}

    nnoremap <silent> <leader>f :ALEFix<CR>
    nnoremap <silent> <leader>e :ALEToggle<CR>
    nnoremap <silent> ]e :ALENextWrap<CR>
    nnoremap <silent> [e :ALEPreviousWrap<CR>
    nnoremap <leader>r :ALEFindReferences -quickfix<CR> :cwindow<cr>
    nnoremap <leader>i :ALEGoToImplementation<CR>
    nnoremap <leader>d :ALEGoToDefinition<CR>

    packadd! vim-gutentags
    packadd! termdebug
endif

" Netrw 

" Opens Netrw on the left with a size of 30 when '-' is pressed
map - :Lexplore<cr>:vertical resize 30<cr>
let g:netrw_liststyle=3
let g:netrw_banner=0

" disapling search highling between searches by hitting space
nnoremap <space> :nohlsearch<bar>:echo<cr>

" auto completion
set completeopt=menu,longest,menuone,noselect,preview,noinsert

" Easy update of vimrc
nmap <Leader>s :source $MYVIMRC<cr>
nmap <Leader>v :e $MYVIMRC<cr>

