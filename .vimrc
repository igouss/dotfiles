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
colorscheme black_angus
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
set autochdir
set smartcase
set wildmenu
set showtabline=2
set directory=~/tmp/
let g:netrw_browse_split = 3

" Folding
set foldenable
set foldlevel=2
set foldmethod=indent

" File detection and indenting
filetype on
filetype plugin indent on
runtime ftplugin/man.vim 

set tabstop=4
set shiftwidth=4
set expandtab
autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd BufNewFile,BufRead *.rhtml setlocal ft=eruby
autocmd BufNewFile,BufRead COMMIT_EDITMSG set filetype=gitcommit
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
map <F2> <Esc>:tabprev<CR>
map <F3> <Esc>:tabnext<CR>

map j <Down>:nohlsearch<CR>
map k <Up>:nohlsearch<CR>
map h <Left>:nohlsearch<CR>
map l <Right>:nohlsearch<CR> 

map <F5> :set paste<CR>
map <F6> :set nopaste<CR>

highlight TabLineSel    guifg=White guibg=Red ctermfg=White ctermbg=Red
highlight TabLine   ctermfg=Black ctermbg=White
highlight TabLineFill ctermfg=Black ctermbg=White

"display trailing whitespace and tabs
highlight SpecialKey ctermfg=DarkGray
set list listchars=tab:\|_,trail:.

