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

set foldmethod=indent
set nofoldenable
set foldlevel=1
set foldnestmax=1

let g:airline_theme='distinguished'
set laststatus=2
autocmd FileType markdown match none

hi Pmenu ctermfg=15, ctermbg=232
hi PmenuSel ctermfg=232, ctermbg=208, gui=bold
hi Comment ctermfg=241
hi LineNr ctermfg=241
hi MatchParen ctermbg=237
hi Search ctermfg=16 ctermbg=248
hi IncSearch ctermfg=16 ctermbg=248
hi Visual ctermfg=248 ctermbg=16

let g:syntastic_python_python_exec='/usr/local/bin/python3'
autocmd FileType python setlocal expandtab tabstop=4 softtabstop=4
autocmd FileType nim setlocal expandtab tabstop=2 softtabstop=2
function! HighlightAnnotations()
	syn keyword cTodo contained HACK NOTE WIP
endfunction
autocmd Syntax * call HighlightAnnotations()

match Type /\v\w*_t(\s|;|,|\)|\t|\{|\}|\*|$)@=/

let mapleader = " "
nmap > >>
nmap < <<
nmap <leader>h 1z=
nmap <leader>w :w<cr>
nmap <leader>q :q<cr>
nmap <leader>m :w<cr>:!mdpdfplus %<cr><cr>
nmap <leader>k :!cat % \| sed 's/.$//' \| pbcopy<cr><cr>
nmap <leader>k maggvG$hy`a
nmap <leader>i ]s
nmap <leader>r :!clear;./%<cr>

nmap <leader>s :!../run<cr>

nmap <leader>l :!../scripts/make.scpt<cr><cr>
nmap <leader>u :!../scripts/bochs.scpt<cr><cr>
nmap <leader>y :!../scripts/kill.scpt<cr><cr>

"map /  <Plug>(incsearch-forward)
"map ?  <Plug>(incsearch-backward)
"map g/ <Plug>(incsearch-stay)

imap “ {<cr>}<esc>ko<tab>


nmap } :tabn<cr>
nmap { :tabp<cr>
vmap > >gv
vmap < <gv

"if system('keyboardlayout') == "Colemak\n"
set langmap=dg,DG,ek,EK,fe,FE,gt,GT,il,IL,jy,JY,kn,KN,lu,LU,nj,NJ,o\\;,O:,pr,PR,rs,RS,sd,SD,tf,TF,ui,UI,yo,YO,\\;p,:P
set nolangremap
"endif
