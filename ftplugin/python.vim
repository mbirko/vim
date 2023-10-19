
let g:gutentags_file_list_command = {
      \ 'markers': {
      \   '.pythontags': expand('~/.vim/python_file_lister.py') . ' ///absolute'
      \ }
      \ }
setlocal makeprg=flake8\ --ignore=E501,E503\ %<.py
setlocal tabstop=8
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal smarttab
setlocal expandtab
setlocal autoindent

augroup python
    autocmd! 
    autocmd BufWritePost *.py silent make | silent redraw! 
augroup end

augroup quickfix
    autocmd! 
    autocmd QuickFixCmdPost [^l]* botright cwindow
    autocmd VimEnter * botright cwindow
augroup end

