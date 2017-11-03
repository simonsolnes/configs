
" .vimrc
" Simon Solnes
" github.com/simonsolnes
" simon@solnes.co

execute pathogen#infect()
set clipboard=unnamed
set mouse=a	
set encoding=utf-8
set backspace=2
set nocompatible
syntax on
let loaded_matchparen = 1			" disable syntax matching parenthesis
filetype plugin on
set wrap linebreak nolist
set noswapfile
set wildmenu						" command line completion
set shell=bash\ --login
set bg=dark
colo desert
set tabpagemax=100
set number
set undofile
set undodir=$HOME/.vim/undo
set undolevels=10000
set undoreload=10000
set hlsearch
set incsearch
set tabstop=4
set shiftwidth=4
set autoindent

let g:airline_theme='distinguished'
set laststatus=2
set statusline=%f\ %l\|%c\ %m%=%p%%\ (%Y%R)
highlight Pmenu ctermfg=15, ctermbg=232
highlight PmenuSel ctermfg=232, ctermbg=208, gui=bold


autocmd FileType python setlocal expandtab tabstop=4 softtabstop=4
let g:syntastic_python_python_exec='/usr/local/bin/python3'
let g:syntastic_go_checkers = ['go']
au BufRead,BufNewFile *.scpt set filetype=applescript

let NERDTreeMapOpenInTab='<ENTER>'
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

let mapleader = " "
nmap > >>
nmap < <<
nmap <leader>h 1z=
nmap <leader>i ]s
vnoremap > >gv
vnoremap < <gv 

if system('keyboardlayout') == "Colemak\n"
	set langmap=dg,DG,ek,EK,fe,FE,gt,GT,il,IL,jy,JY,kn,KN,lu,LU,nj,NJ,o\\;,O:,pr,PR,rs,RS,sd,SD,tf,TF,ui,UI,yo,YO,\\;p,:P
	set nolangremap
endif
