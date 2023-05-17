autocmd filetype netrw call ApplyNetrwMaps()

function! ApplyNetrwMaps()
    nnoremap <buffer> <c-l> <c-w>l
endfunction

