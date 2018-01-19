" .vimrc
" Simon Solnes
" github.com/simonsolnes
" simon@solnes.co

execute pathogen#infect()
set clipboard=unnamed
setlocal autoread 
set mouse=a	
set encoding=utf-8
set backspace=2
set nocompatible
syntax on
let loaded_matchparen = 1
filetype plugin on
set wrap linebreak nolist
set noswapfile
set wildmenu
set shell=bash\ --login
set bg=dark
colo desert
set tabpagemax=100
set number
set number relativenumber
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
set statusline=%f\ %l\|%c\ %m%=%p%%\ (%Y%R)
highlight Pmenu ctermfg=15, ctermbg=232
highlight PmenuSel ctermfg=232, ctermbg=208, gui=bold
autocmd FileType markdown match none

autocmd FileType python setlocal expandtab tabstop=4 softtabstop=4
let g:syntastic_python_python_exec='/usr/local/bin/python3'
let g:syntastic_go_checkers = ['go']
au BufRead,BufNewFile *.scpt set filetype=applescript

let mapleader = " "
nmap > >>
nmap < <<
nmap <leader>h 1z=
nmap <leader>w :w<cr>
nmap <leader>q :q<cr>
nmap <leader>i ]s
nmap <leader>r :!chmod+x %;clear;%:p<cr>
nmap <leader>g :!git commit -am 'temporary commit'; git pull; git push<cr><cr>
vnoremap > >gv
vnoremap < <gv 

"silent exec("!title %:t")
" Disable Arrow keys in Escape mode
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>

" Disable Arrow keys in Insert mode
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

if system('keyboardlayout') == "Colemak\n"
	set langmap=dg,DG,ek,EK,fe,FE,gt,GT,il,IL,jy,JY,kn,KN,lu,LU,nj,NJ,o\\;,O:,pr,PR,rs,RS,sd,SD,tf,TF,ui,UI,yo,YO,\\;p,:P
	set nolangremap
endif
