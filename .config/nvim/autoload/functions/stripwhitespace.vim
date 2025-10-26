" Qargs populates args list with quickfix search list
" Taken from vim tips book
function functions#stripwhitespace#StripTrailingWhitespace()
    if !&binary && &filetype != 'diff'
        normal mz
        normal Hmy
        %s/\s\+$//e
        normal 'yz<CR>
        normal `z
    endif
endfunction
