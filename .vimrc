set guioptions=

if has("syntax")
    let g:xml_syntax_folding = 1
    let perl_fold = 1
    set background=dark
    syntax on
endif

if $TERM == 'screen-256color'
    set t_Co=256
    colorscheme railscasts
else
    colorscheme sbaylis
endif
 
set shiftwidth=4
set tabstop=4
set smarttab
set expandtab
 
set ai
set hlsearch
set ic
set nolist
set listchars=eol:$,tab:»·
set nonu
set noruler
set nowrap
 
" Make VIM7 more VIM6 like.
set completeopt=preview
let loaded_matchparen = 1
set formatoptions=tcq
set complete=.
 
nmap <Leader>a :set ai!<CR>
nmap <Leader>h :nohlsearch<CR>
nmap <Leader>i :set ic!<CR>
nmap <Leader>l :set list!<CR>
nmap <Leader>n :set nu!<CR>
nmap <Leader>r :set ruler!<CR>
nmap <Leader>w :set wrap!<CR>
nmap <Leader># :let b:commentChar = "#"<CR>
nmap <Leader>- :let b:commentChar = "--"<CR>
nmap <Leader>/ :let b:commentChar = "\\/\\/"<CR>
 
set report=0
set bs=2
set viminfo='0
set dictionary=/usr/share/dict/words
" set splitbelow
set splitright
" set mouse=a
 
" --------------------------------------------------------------------------------------------------
iab udd use Data::Dumper ();
iab ddd( Data::Dumper::Dumper(
 
" --------------------------------------------------------------------------------------------------
nmap ,x :w<CR>:!perl -c %<CR>
nmap ,a :ascii<CR>
 
map ,s mzviw"zy/sub *<C-R>z<CR>
nmap <Leader>s /\<sub\>
 
" --------------------------------------------------------------------------------------------------
autocmd BufNewFile,Bufread * let b:commentChar='#'
 
function! Comment() range
execute a:firstline.','.a:lastline.'s/^/'.b:commentChar.'/'
endfunction
 
function! UnComment() range
execute a:firstline.','.a:lastline.'s/^'.b:commentChar.'//'
endfunction
 
map [[ :call Comment() <CR>
map ]] :call UnComment() <CR>
" --------------------------------------------------------------------------------------------------
" Preserve the functionality of <C-L> ( screen refresh... )
noremap <F12> <C-L>
 
" Window switching with the <ALT> h,j,k,l
nmap <C-h> <C-W>h
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-l> <C-W>l
 
" --------------------------------------------------------------------------------------------------
" Folding
" --------------------------------------------------------------------------------------------------
" if has( "folding" )
" set foldenable
" set foldmethod=syntax
" endif
 
" ------------------------------------------------------------------------------
set statusline=%f\ %m%h%r\ %=%25(%-17(%l\,%c%V%)\ %p%%%)
set laststatus=2

" Highlight bad form
:highlight BadForm ctermbg=darkred guibg=darkred
:match BadForm /\s\+$\|\t/

" --------------------------------------------------------------------------------------------------
" NERDTree
" --------------------------------------------------------------------------------------------------
" load at start-up
" autocmd VimEnter * NERDTree
" autocmd VimEnter * wincmd p
map ,t :NERDTreeToggle <CR>

" Show the bookmarks table on startup
let NERDTreeShowBookmarks=1

" Close tree after opening a file
let NERDTreeQuitOnOpen=1

" auto-quit if NERDTree is the only remaining window
function! NERDTreeQuit()
  redir => buffersoutput
  silent buffers
  redir END
"                     1BufNo  2Mods.     3File           4LineNo
  let pattern = '^\s*\(\d\+\)\(.....\) "\(.*\)"\s\+line \(\d\+\)$'
  let windowfound = 0

  for bline in split(buffersoutput, "\n")
    let m = matchlist(bline, pattern)

    if (len(m) > 0)
      if (m[2] =~ '..a..')
        let windowfound = 1
      endif
    endif
  endfor

  if (!windowfound)
    quitall
  endif
endfunction
autocmd WinEnter * call NERDTreeQuit()


" --------------------------------------------------------------------------------------------------
"  FuzzyFinder
"
"  --------------------------------------------------------------------------------------------------
"
" function! ProjectFuzzyFind()
"   let origcurdir = getcwd()
"   let curdir = origcurdir
"   let prevdir = ""
" 
"   while curdir != prevdir
"     if filereadable(".fuzzyfinder")
"       break
"     endif
"     cd ..
"     let prevdir = curdir
"     let curdir = getcwd()
"   endwhile
" 
"   if filereadable(".fuzzyfinder")
"     let items = readfile(".fuzzyfinder")
"     let files = []
"     for n in items
"       let files += split(glob(curdir . "/" . n), "\n")
"     endfor
" 
"     call fuf#givenfile#launch('', 0, '>', files)
"   endif
" endfunction
" 
" map ,p :call ProjectFuzzyFind()<CR>
" let g:fuf_maxMenuWidth = 150
"nnoremap <C-t> :<C-u>FufFile **/<CR> 

" ruby indentation
au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab
au BufNewFile,BufReadPost *.rb setl shiftwidth=2 expandtab
au BufNewFile,BufReadPost *.haml setl shiftwidth=2 expandtab

" For Ivan's thing
map ,r :make <CR>

" filetype indent
filetype plugin indent on
