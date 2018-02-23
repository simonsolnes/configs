execute pathogen#infect()
set clipboard=unnamed
setlocal autoread
set mouse=a
set encoding=utf-8
set backspace=2
set nocompatible
syntax on
set wrap linebreak nolist
set noswapfile
set wildmenu
set shell=bash\ --login
set bg=dark
colo desert
set tabpagemax=100
set number
set undofile
set undodir=$HOME/.vim/undo
set undolevels=10000
set hlsearch
set incsearch
set tabstop=4
set shiftwidth=4
set autoindent

let g:airline_theme='distinguished'
set laststatus=2
autocmd FileType markdown match none

hi Pmenu ctermfg=15, ctermbg=232
hi PmenuSel ctermfg=232, ctermbg=208, gui=bold
hi Comment ctermfg=241
hi LineNr ctermfg=241
hi MatchParen ctermbg=237

let g:syntastic_python_python_exec='/usr/local/bin/python3'

match Type /\v\w*_t(\s|;|,|\)|\t|\{|\}|\*|$)@=/

let mapleader = " "
nmap > >>
nmap < <<
nmap <leader>h 1z=
nmap <leader>w :w<cr>
nmap <leader>q :q<cr>
nmap <leader>m :w<cr>:!mdpdfplus %<cr><cr>
nmap <leader>i ]s
nmap <leader>r :!chmod+x %;clear;%:p<cr>
nmap } :tabn<cr>
nmap { :tabp<cr>
vmap > >gv
vmap < <gv

if system('keyboardlayout') == "Colemak\n"
	set langmap=dg,DG,ek,EK,fe,FE,gt,GT,il,IL,jy,JY,kn,KN,lu,LU,nj,NJ,o\\;,O:,pr,PR,rs,RS,sd,SD,tf,TF,ui,UI,yo,YO,\\;p,:P
	set nolangremap
endif
