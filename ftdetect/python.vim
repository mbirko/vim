au BufRead,BufNewFile *.py call Python_set_up()

function Python_set_up()
    let g:gutentags_file_list_command = {
          \ 'markers': {
          \   '.pythontags': expand('~/.vim/python_file_lister.py') . ' ///absolute'
          \ }
          \ }
    set makeprg=flake8\ %<.py
endfunction

augroup python
    autocmd! 
    autocmd BufWritePost *.py silent make | silent redraw! 
augroup end

augroup quickfix
    autocmd! 
    autocmd QuickFixCmdPost [^l]* cwindow
    autocmd VimEnter * cwindow
augroup end
