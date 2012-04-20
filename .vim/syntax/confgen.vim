hi TrailingWhitespace ctermbg=red guibg=red
syn match TrailingWhitespace /\s\+$/

" all tabs and spaces not in sets of 4 at the beginning of a line
hi WrongWhitespace ctermbg=red guibg=red
syn match WrongWhitespace /\t\+\|^\( \{4\}\)*\zs \{1,3\}\ze[^ ]/
