setlocal spell
setlocal tabstop=2
setlocal shiftwidth=2
setlocal softtabstop=2
setlocal wrap linebreak nolist
nmap <buffer> j gj
nmap <buffer> k gk

" pandoc , markdown
command! -nargs=* RunSilent
      \ | execute ':silent !'.'<args>'
      \ | execute ':redraw!'
nmap <Leader>pc :RunSilent pandoc -o /tmp/vim-pandoc-out.pdf %<CR>
nmap <Leader>pm marp -o /tmp/vim-marp-out.html %<CR>
nmap <Leader>pp :RunSilent open /tmp/vim-marp-out.pdf<CR>
