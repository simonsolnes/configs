"
" .vimrc
" Simon Solnes
"

" TODO:
" buffer management
" new c file setup
" persistency

" OS
	set clipboard=unnamed				" OS-wide clipboard
	set mouse=a							" mouse integration

" GENERAL
	execute pathogen#infect()
	set encoding=utf-8
	set nocompatible					" disable compatibility
	syntax on							" syntax highlighting
	set number							" line numbers
	set backspace=2						" normal backspace
	let loaded_matchparen = 1			" disable syntax matching parenthesis
	set nofoldenable					" disable folding
	set wrap linebreak nolist			" wrap word for word
	set noswapfile						" ahhh the zen
	au BufLeave,FocusLost * silent! wa	" autosave when user is not using the window
	set wildmenu						" command line completion
	set bg=dark
	colo desert
	set foldmethod=indent

" COLORS
	highlight Comment ctermfg=gray
	highlight htmlBold gui=bold guifg=#baa173 ctermfg=145
	highlight htmlItalic gui=italic guifg=#ff8700 ctermfg=231

" SYNTAX
	" HIGHLIGHT LABELS
		function! HighlightAnnotations()
			syn keyword cTodo contained HACK NOTE WIP
		endfunction
		autocmd Syntax * call HighlightAnnotations()
	" APPLE SCRIPT
	au BufRead,BufNewFile *.scpt set filetype=applescript

" TABS
	nnoremap } :tabn<cr>
	nnoremap { :tabp<cr>

" PLUGINS
	let g:airline_theme='distinguished'

" STATUS LINE
	set laststatus=2					" always show status line
	" Pierre Bourdon status line
	set statusline=%f\ %l\|%c\ %m%=%p%%\ (%Y%R)

" SEARCH
	set hlsearch						" highlight all matches
	set incsearch						" instant highlight
	set ignorecase						" ignore case
	set smartcase						" use case when uppercase
	" remove highlighting
	nnoremap <silent> <C-l> :nohl<CR><C-l>

" HARD TABS
	set tabstop=4						" tab width
	set shiftwidth=4					" shift width
	set autoindent						" auto indentation

" PYTHON
	" au BufNewFile,BufRead *.py
		" \ set tabstop=4
		" \ set softtabstop=4
		" \ set shiftwidth=4
		" \ set textwidth=79
		" \ set expandtab
		" \ set autoindent
		" \ set fileformat=unix
	let g:syntastic_python_python_exec='/usr/local/bin/python3'

" UNDO HISTORY
	set undofile						" use an undo file
	set undodir=$HOME/.vim/undo			" undo file path
	set undolevels=1000
	set undoreload=10000

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
		" LEADER
		let mapleader = " "

		" HARD TABS IS THE WAY TO GO
		nmap <leader>T :%s/    /\t/g<cr>
		
		" Save
		nmap <leader>w :w!<cr>
		" Generic commenting toggle
		nnoremap <leader>c :call Comment_toggle()<cr>
		function! Comment_toggle()
			" Detect file type
			redir @a
				silent echon &ft
			redir END
			
			let g:cmnt_del_end = ""
			let g:cmnt_ins_end = ""

			" Write your comment type here!
			if @a == "c" || @a == "java" || @a == "javascript"
				let g:cmnt_ins = "//"
			elseif @a == "python" || @a == "sh" || @a == "perl" || @a == "ruby" || @a == "r"
				let g:cmnt_ins = "#"
			elseif @a == "haskell"
				let g:cmnt_ins = "--"
			elseif @a == "matlab"
				let g:cmnt_ins = "%"
			elseif @a == "vim"
				let g:cmnt_ins = "\""
			elseif @a == "pascal"
				let g:cmnt_ins = "(*"
				let g:cmnt_ins_end = "*)"
			elseif @a == "xml" || @a == "html" || @a == "php" || @a == "markdown"
				let g:cmnt_ins = "<!--"
				let g:cmnt_ins_end = "-->"
			else
				let g:cmnt_ins = "\?"
			endif

			let g:cmnt_del_end = len(g:cmnt_ins_end)
			let g:cmnt_del = len(g:cmnt_ins)
			
			" Test if comment is spaced right
			execute "normal! mxI\<Right>\<Esc>"
			let g:tmp = expand('<cWORD>')
			execute "normal! " . g:cmnt_del . "\<Right>i \<Esc>I\<Right>\<Esc>"
			let g:cmnt_status = expand('<cWORD>')

			if g:cmnt_status != g:cmnt_ins
				" Comment out line
				execute "normal! " . g:cmnt_del . "\<Right>x`x"
				execute "normal! mxI" . g:cmnt_ins . " \<Esc>`x"
				if g:cmnt_ins_end != ""
					execute "normal! mxA " . g:cmnt_ins_end . "\<Esc>`x"
				endif	
			else
				" Un-comment out line
				if g:tmp == g:cmnt_status
					execute "normal! " . g:cmnt_del . "\<Right>x`x"
				else
					execute "normal! `x"
				endif
				execute "normal! mxI\<Right>\<Esc>" . g:cmnt_del . "xx\<Esc>`x"
				if g:cmnt_ins_end != ""
					execute "normal! mxA\<Esc>" . g:cmnt_del_end . "\<Left>\<Esc>" . g:cmnt_del_end ."xx\<Esc>`x"
				endif	
			endif
		endfunction
		" Spelling
		nnoremap <leader>s :call Spell_check_toggle()<cr>
		let g:spell_check = 0
		function! Spell_check_toggle()
				if g:spell_check == 1
					:set nospell
					let g:spell_check = 0
				else
					:set spell spelllang=en_us
					let g:spell_check = 1
				endif
		endfunction

	
	" Only press < or > once for indenting
	nmap > >>
	nmap < <<
	" add new line under current without insert mode with enter
	nmap <CR> o<Esc>
	" add new line over current without insert mode with enter
	nmap <S-Enter> O<Esc>
	" Auto curly bracket
	inoremap ” {<CR>}<Esc>ko
	" BOL is at first non-white char
	map 0 ^
	" Select the text that was last edited/pasted.
	nmap gV `[v`]

	" auto printf 
	nmap <leader>pf iprintf("\n");<Esc>

	" Keep selection when indenting/outdenting.
	vnoremap > >gv
	vnoremap < <gv 

" COMMANDLINE

	" write as root when sudo is forgotten
	cnoreabbrev w!! w !sudo tee % >/dev/null

" PLUGINS
	" vim-markdown
	let g:markdown_fenced_languages = ['coffee', 'css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'xml', 'html']

	" Syntastic
	nmap <leader>st :SyntasticToggleMode<cr>
	nmap <leader>sc :SyntasticCheck<cr>

" EXPERIMENTAL
	" Add semicolon EOL
	nnoremap a; m`A;<esc>``
	" Split line
	nnoremap K i<cr><esc>
