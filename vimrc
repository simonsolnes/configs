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
set shell=fish\ --login
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
set background=dark

set foldmethod=indent
set nofoldenable
set foldlevel=1
set foldnestmax=1

set laststatus=2
set noshowmode
autocmd FileType markdown match none

hi Pmenu ctermfg=15, ctermbg=232
hi PmenuSel ctermfg=232, ctermbg=208, gui=bold
hi Comment ctermfg=243
hi LineNr ctermfg=241
hi MatchParen ctermbg=237
hi Search ctermfg=16 ctermbg=248
hi IncSearch ctermfg=16 ctermbg=248
hi Visual ctermfg=248 ctermbg=16

let g:syntastic_python_python_exec='/usr/local/bin/python3'
autocmd FileType python setlocal expandtab tabstop=4 softtabstop=4
autocmd FileType fsharp setlocal expandtab tabstop=4 softtabstop=4
autocmd FileType nim setlocal expandtab tabstop=2 softtabstop=2
function! HighlightAnnotations()
	syn keyword cTodo contained HACK NOTE WIP
endfunction
autocmd Syntax * call HighlightAnnotations()

set updatetime=100

let NERDTreeWinSize = 30
" open a NERDTree automatically when vim starts up
autocmd vimenter * NERDTree
let g:nerdtree_tabs_autofind=1

" NERDTree will be on new tab
let g:nerdtree_tabs_open_on_console_startup=1

let NERDTreeIgnore = ['\.pyc$', '__pycache__$']

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

map <C-n> <plug>NERDTreeTabsToggle<CR>

"sp
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


"match Type /\v\w*_t(\s|;|,|\)|\t|\{|\}|\*|$)@=/

let mapleader = " "
nmap > >>
nmap < <<
nmap <leader>h 1z=
nmap <leader>t :TagbarToggle<CR>
nmap <leader>w :w<cr>
nmap <leader>q :q<cr>
nmap <leader>m :w<cr>:!mdpdfplus %<cr><cr>
nmap <leader>k :!cat % \| sed 's/.$//' \| pbcopy<cr><cr>
nmap <leader>k maggvG$hy`a
nmap <leader>i ]s
nmap <leader>r :!clear; ./%<cr>
" Indents word-wrapped lines as much as the 'parent' line
set breakindent
" Ensures word-wrap does not split words
set formatoptions=l
set lbr

"!nmap <leader>s :!../run<cr>

nmap <leader>l :!../scripts/make.scpt<cr><cr>
nmap <leader>u :!../scripts/bochs.scpt<cr><cr>
nmap <leader>y :!../scripts/kill.scpt<cr><cr>

"map /  <Plug>(incsearch-forward)
"map ?  <Plug>(incsearch-backward)
"map g/ <Plug>(incsearch-stay)

imap “ {<cr>}<esc>ko<tab>

nmap <Leader>f <Plug>(easymotion-overwin-f)

nmap } :tabn<cr>
nmap { :tabp<cr>
vmap > >gv
vmap < <gv

"if system('keyboardlayout') == "Colemak\n"
"set langmap=dg,DG,ek,EK,fe,FE,gt,GT,il,IL,jy,JY,kn,KN,lu,LU,nj,NJ,o\\;,O:,pr,PR,rs,RS,sd,SD,tf,TF,ui,UI,yo,YO,\\;p,:P
"set nolangremap
"endif

nnoremap <Leader>b :<C-u>call gitblame#echo()<CR>
let g:indent_guides_enable_on_vim_startup = 1

let g:indent_guides_auto_colors = 0
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=1
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=235

let g:indent_guides_start_level=1
let g:indent_guides_guide_size=4

