
au BufRead,BufNewFile *.rst call Rst_set_up()

function Rst_set_up()
    set makeprg=make\ clean\ html\ SPHINXOPTS=-q
    set spell
    set tabstop=3
    set shiftwidth=2
    set expandtab
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
