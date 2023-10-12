au BufRead,BufNewFile *.proto call Proto_set_up()
function Proto_set_up()
    setlocal tabstop=2
    setlocal softtabstop=2
    setlocal shiftwidth=2
    setlocal smarttab
    setlocal expandtab
    setlocal autoindent
endfunction
