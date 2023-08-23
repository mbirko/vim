au BufRead,BufNewFile *.scala call Scala_setup()

function Scala_setup()
    setlocal tabstop=2
    setlocal softtabstop=2
    setlocal shiftwidth=2
    setlocal smarttab
    setlocal autoindent
endfunction
