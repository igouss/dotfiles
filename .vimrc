" 
" Author: Iouri Goussev <i.gouss+vimrc@gmail.com>
"
set nocompatible
" Behaviour
set backup
set backupcopy=yes
set incsearch
set mouse=a
set backspace=2
set history=50

" Visual
syntax on
"colorscheme delek
colorscheme black_angus
set ruler
set showcmd
set cmdheight=2
set laststatus=2
"set number
set showmatch
set mat=5 " how many tenths of a second to blink matching brackets for
set novisualbell
set noerrorbells
set showmode
set cursorline
set hlsearch
set statusline=[%l,%c\ %P%M]\ %f\ %r%h%w
set title
set icon
set autoread
set smartcase
set wildmenu
set virtualedit=all
" allow ESC-sequenzes in 'insert-mode'
set esckeys
set showtabline=2
set directory=~/tmp/
set shortmess=atI " shortens messages to avoid 'press a key' prompt
let g:netrw_browse_split=3
let g:netrw_hide=1
let g:netrw_fastbrowse=0
" Folding
set foldenable
set foldlevel=3
set foldmethod=indent

set guioptions-=m
set guioptions-=T

" File detection and indenting
filetype on
filetype plugin indent on
runtime ftplugin/man.vim

set tabstop=4
set shiftwidth=4
"set expandtab

"autocmd {event} {path} {ex commands and options}
"autocmd BufRead,BufNewFile *.java set expandtab
autocmd BufRead,BufNewFile todo.txt,*.todo.txt,recur.txt,*.todo set filetype=todo
autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd BufNewFile,BufRead *.rhtml setlocal ft=eruby
autocmd BufNewFile * :exe("0r! ~/.vim/skeleton.rb %:p " . &filetype)
autocmd BufNewFile,BufRead COMMIT_EDITMSG set filetype=gitcommit
" When editing a file, always jump to the last cursor position.
autocmd BufReadPost * if line("'\"") && line("'\"") <= line("$") | exe "normal `\"" | endif
autocmd BufNewFile,BufRead *.groovy  setf groovy 

if did_filetype()
    finish
endif

if getline(1) =~ '^#!.*[/\\]groovy\>'
    setf groovy
endif

let g:explHideFiles='^\.,\.~$,*swp$,\.DS_Store$'
let g:explDetailedHelp=0
let g:explDirsFirst=-1
let g:explDetailedHelp=0

inoremap <C-Space> <C-X><C-O>
map  :Texplore<CR>

map <C-PageUp> <Esc>:tabnew<CR>
map <C-Left> :tabprev<CR>
map <c-Right> <Esc>:tabnext<CR>
map <C-PageDown> <Esc>:tabclose<CR> 

"nnoremap <Tab> <Esc>:tabnext<CR>
"nnoremap <S-Tab> <Esc>:tabprev<CR>

map <c-l> <Esc>:nohlsearch<CR>

" remap Ctrl-W to delerte current word
"map <C-W> bdwA
"imap <C-W> <Esc>bdwA

" indent whole buffer
noremap <F8> gg=G``

set pastetoggle=<F5>
nmap :W :w
nmap :Q :q
nmap :WQ :wq

"map <F5> :set paste<CR>
"map <F6> :set nopaste<CR>
"nmap <leader>rci :%!ruby-code-indenter<cr>

highlight TabLineSel    guifg=White guibg=Red ctermfg=White ctermbg=Red
highlight TabLine   ctermfg=Black ctermbg=White
highlight TabLineFill ctermfg=Black ctermbg=White

"highlight ExtraWhitespace ctermbg=darkgreen guibg=lightgreen
"highlight ExtraWhitespace ctermbg=red guibg=red
"highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
"autocmd BufWinEnter * match ExtraWhitespace /^\s* \s*\|\s\+$/


"display trailing whitespace and tabs
highlight SpecialKey ctermfg=DarkGray
set list listchars=tab:\|_,trail:.


set statusline=%<[%n]\ %F\ \ Filetype=\%Y\ \ %r\ %1*%m%*%w%=%(Line:\ %l%)%4(%)Column:\ %5(%c%V/%{strlen(getline(line('.')))}%)\ %4(%)%p%%
" set statusline=[%n]\ %<%f\ %((%1*%M%*%R%Y)%)\ %=%-19(\LINE\ [%3l/%3L]\ COL\ [%02c%03V]%)\ %P
" set statusline=\ %m%r\ \ (Vim\ %{Version()})\ [%02n]\ %t\ [%{Fileformat()}]\ %=(%Y)\ L:%l/%L\ C:%c\ P:%p\ \ \ [%{strftime\(\"\%R\"\)}]\%<\ \ \
" set statusline=-%m%r-----(Vim\ %{Version()})\ [%02n]\ %t\ %=(%Y)\ %l/%L,%c\ \ [%{strftime\(\"\%R\"\)}]\%<---------
" set statusline=[%n]\ %<%f\ %((%1*%M%*%R%Y)%)\ %=%-19(\LINE\ [%3l/%3L]\ COL\ [%02c%03V]%)\ ascii['%02b']\ %P
" set statusline=%<[%n]\ %F\ \ Filetype=\%Y\ \ Fileformat=%{Fileformat()}\ \ %r\ %1*%m%*%w%=%(Column:\ %c%V%)%4(%)%-10(Line:\ %l%)\ %4(%)%p%% 
" set statusline=%4*%m%3*%<%F%3*%=Christian\ Schneider\ %5*\ Line\et
function! GuiTabLabel()
	" add the tab number
	let label = '['.tabpagenr()
 
	" modified since the last save?
	let buflist = tabpagebuflist(v:lnum)
	for bufnr in buflist
		if getbufvar(bufnr, '&modified')
			let label .= '*'
			break
		endif
	endfor
 
	" count number of open windows in the tab
	let wincount = tabpagewinnr(v:lnum, '$')
	if wincount > 1
		let label .= ', '.wincount
	endif
	let label .= '] '
 
	" add the file name without path information
	let n = bufname(buflist[tabpagewinnr(v:lnum) - 1])
	let label .= fnamemodify(n, ':t')
 
	return label
endfunction

function! s:SID_PREFIX()
 return matchstr(expand('<sfile>'), '<SNR>\d\+_')
endfunction

function! s:GetTabVar(tabnr, varname)
  " Wrapper for non standard (my own) built-in function gettabvar().
  return exists('*gettabvar') ? gettabvar(a:tabnr, a:varname) : ''
endfunction

" VCS branch name  "{{{2
" Returns the name of the current branch of the given directory.
" BUGS: git is only supported.
let s:_vcs_branch_name_cache = {}  " dir_path = [branch_name, key_file_mtime]


function! s:vcs_branch_name(dir)
  let cache_entry = get(s:_vcs_branch_name_cache, a:dir, 0)
  if cache_entry is 0
   \ || cache_entry[1] < getftime(s:_vcs_branch_name_key_file(a:dir))
    unlet cache_entry
    let cache_entry = s:_vcs_branch_name(a:dir)
    let s:_vcs_branch_name_cache[a:dir] = cache_entry
  endif

  return cache_entry[0]
endfunction


function! s:_vcs_branch_name_key_file(dir)
  return a:dir . '/.git/HEAD'
endfunction


function! s:_vcs_branch_name(dir)
  let head_file = s:_vcs_branch_name_key_file(a:dir)
  let branch_name = ''

  if filereadable(head_file)
    let ref_info = s:first_line(head_file)
    if ref_info =~ '^\x\{40}$'
      let remote_refs_dir = a:dir . '/.git/refs/remotes/'
      let remote_branches = split(glob(remote_refs_dir . '**'), "\n")
      call filter(remote_branches, 's:first_line(v:val) ==# ref_info')
      if 1 <= len(remote_branches)
        let branch_name = 'remote: '. remote_branches[0][len(remote_refs_dir):]
      endif
    else
      let branch_name = matchlist(ref_info, '^ref: refs/heads/\(\S\+\)$')[1]
      if branch_name == ''
        let branch_name = ref_info
      endif
    endif
  endif

  return [branch_name, getftime(head_file)]
endfunction

function! s:first_line(file)
  let lines = readfile(a:file, '', 1)
  return 1 <= len(lines) ? lines[0] : ''
endfunction




function! s:MyTabLine()  "{{{
  let s = ''

  for i in range(1, tabpagenr('$'))
    let bufnrs = tabpagebuflist(i)
    let curbufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first appears

    let no = (i <= 10 ? i-1 : '#')  " display 0-origin tabpagenr.
    let mod = len(filter(bufnrs, 'getbufvar(v:val, "&modified")')) ? '+' : ' '
    let title = s:GetTabVar(i, 'title')
    let title = len(title) ? title : fnamemodify(s:GetTabVar(i, 'cwd'), ':t')
    let title = len(title) ? title : fnamemodify(bufname(curbufnr),':t')
    let title = len(title) ? title : '[No Name]'

    let s .= '%'.i.'T'
    let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
    let s .= no
    let s .= mod
    let s .= title
    let s .= '%#TabLineFill#'
    let s .= '  '
  endfor

  let s .= '%#TabLineFill#%T'
  let s .= '%=%#TabLine#'
  let s .= '| '
  let s .= '%999X'
  let branch_name = s:vcs_branch_name(getcwd())
  let s .= (branch_name != '' ? branch_name : '?')
  let s .= '%X'
  return s
endfunction "}}}
let &tabline = '%!' . s:SID_PREFIX() . 'MyTabLine()'

