augroup rust
    autocmd! 
    autocmd FileType rust compiler rustc
    autocmd BufWritePost *.rs silent make | silent redraw! 
augroup end

augroup quickfix
    autocmd! 
    autocmd QuickFixCmdPost [^l]* cwindow
    autocmd VimEnter * cwindow
augroup end
