set nocompatible
" Behaviour
set backup
set incsearch
set mouse=a
set backspace=indent,eol,start
set history=50

" Visual
syntax on
"colorscheme delek
colorscheme clarity
set ruler
set showcmd
set cmdheight=2
set laststatus=2
"set number
set showmatch
set showmode
set cursorline
set hlsearch
set statusline=[%l,%c\ %P%M]\ %f\ %r%h%w
set title 
set icon
set autoread

" Folding
set foldenable
set foldlevel=2
set foldmethod=indent

" File detection and indenting
filetype on
filetype plugin on
filetype plugin indent on
runtime ftplugin/man.vim 

set tabstop=4
set shiftwidth=4
set expandtab
autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd BufNewFile,BufRead *.rhtml setlocal ft=eruby
autocmd BufNewFile,BufRead COMMIT_EDITMSG set filetype=gitcommit

let g:explHideFiles='^\.,.*\.sw[po]$,.*\.log$'
let g:explDetailedHelp=0
map  :Texplore<CR>

map <s-t> <Esc>:tabclose<CR> 
map <c-t> <Esc>:tabnew<CR>
map <F2> <Esc>:tabprev<CR>
map <F3> <Esc>:tabnext<CR>

map j <Down>:nohlsearch<CR>
map k <Up>:nohlsearch<CR>
map h <Left>:nohlsearch<CR>
map l <Right>:nohlsearch<CR> 

map <F5> :set paste<CR>
map <F6> :set nopaste<CR>

