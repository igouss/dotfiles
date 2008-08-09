set nocompatible
" Behaviour
set backup
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
set autochdir
set smartcase
set wildmenu
" allow ESC-sequenzes in 'insert-mode'
set esckeys
set showtabline=2
set directory=~/tmp/
set shortmess=atI " shortens messages to avoid 'press a key' prompt
let g:netrw_browse_split=3
let g:netrw_hide=1
let g:netrw_fastbrowse=2
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

autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd BufNewFile,BufRead *.rhtml setlocal ft=eruby
au BufNewFile * :exe("0r! ~/.vim/skeleton.rb %:p " . &filetype)
autocmd BufNewFile,BufRead COMMIT_EDITMSG set filetype=gitcommit
" When editing a file, always jump to the last cursor position.
autocmd BufReadPost * if line("'\"") && line("'\"") <= line("$") | exe "normal `\"" | endif

au BufNewFile,BufRead *.groovy  setf groovy 
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
map  :Texplore<CR>

map <F1> <Esc>:tabclose<CR> 
map <c-t> <Esc>:tabnew<CR>
"map <F2> <Esc>:tabprev<CR>
"map <F3> <Esc>:tabnext<CR>

nnoremap <Tab> <Esc>:tabnext<CR>
nnoremap <S-Tab> <Esc>:tabprev<CR>

map <c-l> <Esc>:nohlsearch<CR>

" remap Ctrl-W to delerte current word
map <C-W> bdwA
imap <C-W> <Esc>bdwA

" indent whole buffer
noremap <F8> gg=G``

set pastetoggle=<F5>
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

