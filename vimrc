set backspace=eol,start,indent
" Shhhhh, be silent... 
set belloff=all
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
" Enable filetype plugins
filetype plugin indent on
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
        \ && &filetype !=# "typst"
        \ && &buftype  !=# "nofile"
        \ && &buftype  !=# "nowrite"
        \ && &buftype  !=# "terminal"
        \ | silent write | endif
augroup end

" Packs! 
if v:version >= 800
    " sad :( 
    packadd! copilot.vim
    imap <silent><script><expr> <C-l> copilot#Accept("\<CR>")
    let g:copilot_no_tab_map = v:true
    " Enable and disaple Copilot
    nnoremap <leader>l :Copilot enable<CR>
    nnoremap <leader>L :Copilot disable<CR>
     
    " LSP client
    packadd! ale
    let g:ale_completion_enabled=1
    let g:ale_sign_column_always=1
    let g:ale_linters = {
    \  'scala': ['metals'],
    \  'python': ['pyright'],
    \  'haskell': ['stack_ghc','cabal_ghc','hlint', 'hdevtools'],
    \  'prolog': ['swipl'],
    \}
    let g:ale_fixers = {
    \  'scala':   ['scalafmt', 'trim_whitespace', 'remove_trailing_lines'],
    \  'python':  ['black', 'trim_whitespace', 'remove_trailing_lines'],
    \  'haskell': ['hfmt', 'trim_whitespace', 'remove_trailing_lines'],
    \  'json': ['fixjson'],
    \}
    let g:ale_haskell_hls_config = {'haskell': {'maxCompletions': 250}}

    let g:ale_set_ballons=1 
    let g:ale_hover_to_floating_preview=1
    nnoremap <silent> <leader>f :ALEFix<CR>
    nnoremap <silent> <leader>e :ALEToggle<CR>
    nnoremap <silent> ]e :ALENextWrap<CR>
    nnoremap <silent> [e :ALEPreviousWrap<CR>
    nnoremap <leader>r :ALERename<CR>
    nnoremap gr :ALEFindReferences -quickfix<CR> :cwindow<cr>
    nnoremap gi :ALEGoToImplementation<CR>
    nnoremap gd :ALEGoToDefinition<CR>
    nnoremap K :ALEHover<CR>
    
    " native terminal deubber
    packadd! termdebug

    " auto tags
    if executable('ctags')
        packadd! vim-gutentags
    endif

    " tmux navigator
    if executable("tmux")
        packadd! vim-tmux-navigator
    endif
    
    " fzf
    if executable("fzf")
        packadd! fzf.vim
        packadd! fzf
        " Source:
        " https://dev.to/iggredible/how-to-search-faster-in-vim-with-fzf-vim-36ko
        nnoremap <silent> <Leader>b :Buffers<CR>
        nnoremap <silent> <C-f> :Files<CR>
        nnoremap <silent> <Leader>f :Rg<CR>
    endif
endif

" Netrw 

" Opens Netrw on the left with a size of 30 when '-' is pressed
map - :Lexplore<cr>:vertical resize 30<cr>
let g:netrw_liststyle=3
let g:netrw_banner=0

" disapling search highling between searches by hitting space
nnoremap <space> :nohlsearch<bar>:echo<cr>

" auto completion
set completeopt=menu,longest,menuone,preview

" Easy update of vimrc
nmap <Leader>s :source $MYVIMRC<cr>
nmap <Leader>v :e $MYVIMRC<cr>

