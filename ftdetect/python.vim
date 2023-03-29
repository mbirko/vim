au BufRead,BufNewFile *py call Python_set_up()

function Python_set_up()
    echo "Method ran"
    let g:gutentags_file_list_command = {
          \ 'markers': {
          \   '.pythontags': expand('~/.vim/python_file_lister.py') . ' ///absolute'
          \ }
          \ }
endfunction
