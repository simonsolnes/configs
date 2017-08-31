"
" .vimrc
" Simon Solnes
" github.com/simonsolnes
" simon@solnes.co
"

" OS
	set clipboard=unnamed				" OS-wide clipboard
	set mouse=a							" mouse integration

" GENERAL
	execute pathogen#infect()
	set encoding=utf-8
	set nocompatible					" disable compatibility
	syntax on							" syntax highlighting
	set backspace=2						" normal backspace
	let loaded_matchparen = 1			" disable syntax matching parenthesis
	set nofoldenable					" disable folding
	set foldmethod=indent
	filetype plugin on
	set wrap linebreak nolist			" wrap word for word
	set noswapfile						" ahhh the zen
	au BufLeave,FocusLost * silent! wa	" autosave
	set wildmenu						" command line completion
	set shell=/usr/local/bin/fish		" fish shell instead of bash
	set bg=dark
	colo desert
	" Undo
		set undofile						" use an undo file
		set undodir=$HOME/.vim/undo			" undo file path
		set undolevels=1000
		set undoreload=10000
	" Search
		set hlsearch						" highlight all matches
		set incsearch						" instant highlight
		set ignorecase						" ignore case
		set smartcase						" use case when uppercase
		" remove highlighting
		nnoremap <silent> <C-l> :nohl<CR><C-l>
	" Hard tabs
		set tabstop=4						" tab width
		set shiftwidth=4					" shift width
		set autoindent						" auto indentation

" ENVIRONMENT
	set number							" line numbers
	" Status line
		let g:airline_theme='distinguished'
		set laststatus=2					" always show status line
		" Pierre Bourdon status line
		set statusline=%f\ %l\|%c\ %m%=%p%%\ (%Y%R)
	" Window tabs
		nnoremap } :tabn<cr>
		nnoremap { :tabp<cr>

" SYNTAX
	highlight Comment ctermfg=gray
	highlight htmlBold gui=bold guifg=#baa173 ctermfg=145
	highlight htmlItalic gui=italic guifg=#ff8700 ctermfg=231
	" Highlight code labels
		function! HighlightAnnotations()
			syn keyword cTodo contained HACK NOTE WIP
		endfunction
		autocmd Syntax * call HighlightAnnotations()

" FILE SPECIFIC
	" Python
		autocmd FileType python setlocal expandtab tabstop=4 softtabstop=4
		let g:syntastic_python_python_exec='/usr/local/bin/python3'
	" Go
		let g:syntastic_go_checkers = ['go']
	" Apple script
		au BufRead,BufNewFile *.scpt set filetype=applescript
	" Fish
		au BufRead,BufNewFile *.fish set filetype=fish
	" Markdown
		let g:markdown_fenced_languages = ['coffee', 'css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'xml', 'html', 'tex', 'latex']
	" Nim
		fun! JumpToDef()
		  if exists("*GotoDefinition_" . &filetype)
			call GotoDefinition_{&filetype}()
		  else
			exe "norm! \<C-]>"
		  endif
		endf

		" Jump to tag
		nn <leader>e :call JumpToDef()<cr>
		ino <M-g> <esc>:call JumpToDef()<cr>i

" LINE MOVING
	" Move lines up or down with <A-{j/k}>
	" For non-macOS use <A-{j/k}> instead of ∆/˚
	nnoremap ∆ :m .+1<CR>==
	nnoremap ˚ :m .-2<CR>==
	inoremap ∆ <Esc>:m .+1<CR>==gi
	inoremap ˚ <Esc>:m .-2<CR>==gi
	vnoremap ∆ :m '>+1<CR>gv=gv
	vnoremap ˚ :m '<-2<CR>gv=gv

" MAPS
	let mapleader = " "

	" Environment

		" Convert to hard tabs
		nmap <leader>T :%s/    /\t/g<cr>
		
		" Save
		nmap <leader>w :w!<cr>

		" Syntastic
		nmap <leader>st :SyntasticToggleMode<cr>
		nmap <leader>sc :SyntasticCheck<cr>

	" Shortcuts
	
		" Only press < or > once for indenting
		nmap > >>
		nmap < <<

		" add new line under current without insert mode with enter
		nmap <CR> o<Esc>

		" add new line over current without insert mode with enter
		nmap <S-Enter> O<Esc>

		" Auto curly bracket
		inoremap ” {<CR>}<Esc>kA<CR><TAB>

		" Select the text that was last edited/pasted.
		nmap gV `[v`]

		" auto print
		nmap <leader>pc Aprintf("\n");<Esc>hhhhi
		nmap <leader>pg Afmt.Println("")<Esc>hi

		" split line
		nnoremap<leader>k i<cr><esc>

		" Keep selection when indenting/outdenting.
		vnoremap > >gv
		vnoremap < <gv 

" COMMANDLINE

	" write as root when sudo is forgotten
	cnoreabbrev w!! w !sudo tee % >/dev/null

" :)
