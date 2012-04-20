" highlight trailing whitespace and spaces before a tab
hi WrongWhitespace ctermbg=red guibg=red
"syn match WrongWhitespace / \+\ze\t\|\t\zs \+\|^ \+/
syn match WrongWhitespace /\t\+\|^\( \{4\}\)*\zs \{1,3\}\ze[^ ]/

hi TrailingWhitespace ctermbg=red guibg=red
syn match TrailingWhitespace /\s\+$/

