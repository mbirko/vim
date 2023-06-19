
au BufRead,BufNewFile *.rst call Rst_set_up()

function Rst_set_up()
    setlocal makeprg=make\ clean\ html\ SPHINXOPTS=-q
    setlocal spell
    setlocal tabstop=3
    setlocal shiftwidth=3
    setlocal softtabstop=3
    setlocal expandtab
    setlocal wrap linebreak nolist
    nmap <buffer> j gj
    nmap <buffer> k gk
endfunction

augroup rst
    autocmd! 
    autocmd BufWritePost *.rst make | silent redraw! 
augroup end

augroup quickfix
    autocmd! 
    autocmd QuickFixCmdPost [^l]* cwindow
    autocmd VimEnter * cwindow
augroup end
