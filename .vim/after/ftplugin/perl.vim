let b:commentChar = "#"
set formatoptions=tcq

" --------------------------------------------------------------------------------------------------
set statusline=%f%{CurrSubName()}\ %m%h%r\ %=%25(%-17(%l\,%c%V%)\ %p%%%)
set maxfuncdepth=250

function! CurrSubName()
	let g:subname = ""
	let g:subrecurssion = 0

	call GetSubName(line("."))

	return g:subname
endfunction

function! GetSubName(line)
	let l:str = getline(a:line)

	if l:str =~ '^sub'
		let l:str = substitute( l:str, " *{.*", "", "" )
		let l:str = substitute( l:str, "sub *", ": ", "" )
		let g:subname = l:str
		return 1
	elseif ( l:str =~ '^}' || l:str =~ '^} *#' ) && g:subrecurssion == 1
		return -1
	elseif a:line > 2
		let g:subrecurssion = g:subrecurssion + 1
		if g:subrecurssion < 190
			call GetSubName(a:line - 1)
		else
			let g:subname = ': <too deep>'
			return -1
		endif
	else
		return -1
	endif
endfunction

" --------------------------------------------------------------------------------------------------
function! RunFile()
	let l:filename = @%
	new
	exe "1,$!" . l:filename
	set buftype=nofile nowrap
endfunction

" --------------------------------------------------------------------------------------------------
function! PerlDocFunc()
	let l:perlfunc = input( "Which function: " )
	new
	exe "1,$! perldoc -f " . l:perlfunc
	set buftype=nofile nowrap
endfunction


