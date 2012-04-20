hi TrailingWhitespace ctermbg=red guibg=red
syn match TrailingWhitespace /\s\+$/

hi LineTooLong ctermbg=red guibg=red
syn match LineTooLong /.\{80\}\zs.\+/

hi WrongWhitespace ctermbg=red guibg=red
syn match WrongWhitespace /\t\+\|^\( \{3\}\)*\zs \{1,2\}\ze[^ ]\|^\( \{3\}\)*\zs \{4,\}\ze[^ ]/
