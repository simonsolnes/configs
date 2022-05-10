--require 'user.lsp'
local set = vim.opt
set.shortmess='I'
set.number = true
set.clipboard = 'unnamed'
set.mouse='a'
set.swapfile=false
set.ttyfast=true
set.autoread=true
set.encoding='utf-8'
set.modifiable=true
set.updatetime=100
set.termguicolors=true
set.background='dark'
set.tabstop=4
set.shiftwidth=4
set.autoindent=true
set.title=true
set.scrolloff=10
set.smartindent=true
set.splitbelow=true
set.splitright=true

vim.cmd([[:auto BufEnter * let &titlestring = expand("%:.")]])
--vim.cmd([[:set title titlestring=%<%F%=%l/%L-%P ]])

local plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')
--plug 'https://github.com/preservim/nerdtree'
plug 'https://github.com/nvim-treesitter/nvim-treesitter'
plug 'https://github.com/nvim-lua/plenary.nvim'
plug 'https://github.com/phaazon/hop.nvim'
plug 'https://github.com/airblade/vim-gitgutter'
plug 'https://github.com/nvim-telescope/telescope.nvim'
plug 'https://github.com/norcalli/nvim-colorizer.lua'
plug 'https://github.com/vim-airline/vim-airline'
plug 'https://github.com/ryanoasis/vim-devicons'
plug 'https://github.com/tpope/vim-fugitive'
plug 'editorconfig/editorconfig-vim'
--plug 'https://github.com/tiagofumo/vim-nerdtree-syntax-highlight'

plug 'https://github.com/ms-jpq/chadtree'
-- plug 'ms-jpq/chadtree'

-- Color schemes
plug 'https://github.com/bluz71/vim-moonfly-colors' -- moonfly
plug 'https://github.com/Everblush/everblush.vim' -- everblush
plug 'https://github.com/olimorris/onedarkpro.nvim' -- onedarkpro
plug 'vim-airline/vim-airline-themes'
-- LSP
--plug 'https://github.com/williamboman/nvim-lsp-installer'
plug 'https://github.com/neovim/nvim-lspconfig'
plug 'https://github.com/j-hui/fidget.nvim'
--plug 'https://github.com/iamcco/diagnostic-languageserver'
-- TS
--plug 'https://github.com/MunifTanjim/eslint.nvim'
plug 'https://github.com/jose-elias-alvarez/null-ls.nvim'
plug 'https://github.com/jose-elias-alvarez/nvim-lsp-ts-utils'

vim.call('plug#end')
require'hop'.setup()
require'colorizer'.setup()

--vim.cmd [[colorscheme xcode]]
--

	--"highlight VertSplit guibg=NONE

--let NERDTreeMinimalUI=1
--"highlight treeDir guifg=white


--vim.cmd([[let g:airline#extensions#tabline#fnamemod = ":t"]])
vim.cmd('let g:airline#extensions#tabline#enabled = 1')
vim.cmd('let g:airline#extensions#tabline#fnamemod = \':.\'')
vim.cmd('let g:airline#extensions#tabline#fnamecollapse = 0')

vim.cmd([[let g:airline_theme='deus']])
-- Python
--require'lspconfig'.pyright.setup{}
--
-- npm i -g pyright
--
require"fidget".setup{}
--
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  },
}
--ESlint
-- npm i -g vscode-langservers-extracted
--require'lspconfig'.eslint.setup{}
--vim.cmd('NERDTreeMinimalUI=true')
function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.g.mapleader = ' '

function control(inp)
	return '<C-'..inp..'>'
end

function leader(inp)
	return '<Leader>' .. inp
end

function cmd(inp)
	return ':'..inp..'<Enter>'
end



map('n', control('n'), cmd('CHADopen'), {silent = true})

map('n', control('h'), control('w') .. 'h', {silent = true})
map('n', control('j'), control('w') .. 'j', {silent = true})
map('n', control('k'), control('w') .. 'k', {silent = true})
map('n', control('l'), control('w') .. 'l', {silent = true})

map('n', leader('w'), ':w<Enter>')
map('n', leader('r'), ':!./%<Enter>')
map('n', '<Leader><Leader>', ':w<Enter>')
map('n', '<Leader>q', ':q<Enter>')
map('n', '<Leader>wq', ':wq<Enter>')
map('n', '<Leader>f', ':HopChar1<Enter>', {silent = true})
map('n', '<Leader>R', ':source ~/.config/nvim/init.lua<Enter>', {silent = true})

map('n', '<Leader>tf', ':Telescope find_files<Enter>')
map('n', '<Leader>tg', ':Telescope live_grep<Enter>')
--map('n', leader('r'), ':<C-p><Enter>')

map('n', '’', cmd('tabn'), {silent = true}) -- Alt ]
map('n', '”', cmd('tabp'), {silent = true}) -- Alt [
map('n', '‘', cmd('bn'), {silent = true}) -- Alt Shift ]
map('n', '“', cmd('bp'), {silent = true}) -- Alt Shift [

map('n', '¬', cmd('bn'), {silent = true}) -- Alt l
map('n', '˙', cmd('bp'), {silent = true}) -- Alt h
map('n', '∑', ':bp<bar>sp<bar>bn<bar>bd<Enter>') -- Alt w
map('n', leader('q'), ':bp<bar>sp<bar>bn<bar>bd<Enter>') -- Alt w
map('n', leader('bl'), ':buffers<Enter>:buffer ', {silent = true})

	-- Scroll one line at the time
	
	--
	
	
	
--map('n', '<ScrollWheelUp>', control('Y'), {silent = true})
--map('n', '<ScrollWheelDown>', control('E'), {silent = true})

--map('n', 'o', 'o<Esc>^Da', {silent = true})
--map('n', 'O', 'O<Esc>^Da', {silent = true})
vim.cmd([[
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
]])
function th()
	print('ee')
end

vim.api.nvim_command('autocmd BufWritePost call th()')



-- Lsp

--require("lspconfig").pylsp.setup{}



--[[
local null_ls = require("null-ls")
local eslint = require("eslint")

null_ls.setup()

eslint.setup({
  bin = 'eslint_d', -- or `eslint_d`
  code_actions = {
    enable = true,
    apply_on_save = {
      enable = true,
      types = { "problem" }, -- "directive", "problem", "suggestion", "layout"
    },
    disable_rule_comment = {
      enable = true,
      location = "separate_line", -- or `same_line`
    },
  },
  diagnostics = {
    enable = true,
    report_unused_disable_directives = false,
    run_on = "save", -- or `save`
  },
})
]]



local onedarkpro = require("onedarkpro")
onedarkpro.setup({
	colors = {
	  onedark = {
		bg = "#202020" -- yellow
	  },
	  onelight = {
		bg = "#00FF00" -- green
	  }
	},
	options = {
		window_unfocussed_color = false
	}
})
onedarkpro.load()

local lspconfig = require("lspconfig")
local null_ls = require("null-ls")
local buf_map = function(bufnr, mode, lhs, rhs, opts)
    vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts or {
        silent = true,
    })
end
local on_attach = function(client, bufnr)
    vim.cmd("command! LspDef lua vim.lsp.buf.definition()")
    vim.cmd("command! LspFormatting lua vim.lsp.buf.formatting()")
    vim.cmd("command! LspCodeAction lua vim.lsp.buf.code_action()")
    vim.cmd("command! LspHover lua vim.lsp.buf.hover()")
    vim.cmd("command! LspRename lua vim.lsp.buf.rename()")
    vim.cmd("command! LspRefs lua vim.lsp.buf.references()")
    vim.cmd("command! LspTypeDef lua vim.lsp.buf.type_definition()")
    vim.cmd("command! LspImplementation lua vim.lsp.buf.implementation()")
    vim.cmd("command! LspDiagPrev lua vim.diagnostic.goto_prev()")
    vim.cmd("command! LspDiagNext lua vim.diagnostic.goto_next()")
    vim.cmd("command! LspDiagLine lua vim.diagnostic.open_float()")
    vim.cmd("command! LspSignatureHelp lua vim.lsp.buf.signature_help()")
    buf_map(bufnr, "n", "gd", ":LspDef<CR>")
    buf_map(bufnr, "n", "gr", ":LspRename<CR>")
    buf_map(bufnr, "n", "gy", ":LspTypeDef<CR>")
    buf_map(bufnr, "n", "K", ":LspHover<CR>")
    buf_map(bufnr, "n", "[a", ":LspDiagPrev<CR>")
    buf_map(bufnr, "n", "]a", ":LspDiagNext<CR>")
    buf_map(bufnr, "n", "ga", ":LspCodeAction<CR>")
    buf_map(bufnr, "n", "<Leader>a", ":LspDiagLine<CR>")
    buf_map(bufnr, "i", "<C-x><C-x>", "<cmd> LspSignatureHelp<CR>")
    if client.resolved_capabilities.document_formatting then
        vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
    end
end
lspconfig.tsserver.setup({
    on_attach = function(client, bufnr)
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false
        local ts_utils = require("nvim-lsp-ts-utils")
        ts_utils.setup({})
        ts_utils.setup_client(client)
        buf_map(bufnr, "n", "gs", ":TSLspOrganize<CR>")
        buf_map(bufnr, "n", "gi", ":TSLspRenameFile<CR>")
        buf_map(bufnr, "n", "go", ":TSLspImportAll<CR>")
        on_attach(client, bufnr)
    end,
})
null_ls.setup({
    sources = {
        --null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.code_actions.eslint,
        null_ls.builtins.formatting.prettier,
    },
	on_attach = function(client)
		if client.resolved_capabilities.document_formatting then
			vim.cmd([[
			augroup LspFormatting
				autocmd! * <buffer>
				autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
			augroup END
			]])
		end
	end,
})
vim.lsp.buf.formatting_sync(nil, 10000)

vim.cmd([[
let g:terminal_color_0  = '#ff0000'
let g:terminal_color_1  = '#cc0000'
let g:terminal_color_2  = '#4e9a06'
let g:terminal_color_3  = '#c4a000'
let g:terminal_color_4  = '#3465a4'
let g:terminal_color_5  = '#75507b'
let g:terminal_color_6  = '#0b939b'
let g:terminal_color_7  = '#d3d7cf'
let g:terminal_color_8  = '#555753'
let g:terminal_color_9  = '#ef2929'
let g:terminal_color_10 = '#8ae234'
let g:terminal_color_11 = '#fce94f'
let g:terminal_color_12 = '#729fcf'
let g:terminal_color_13 = '#ad7fa8'
let g:terminal_color_14 = '#00f5e9'
let g:terminal_color_15 = '#eeeeec'
]])

vim.cmd([[
let g:chadtree_colours = {
      \ "8_bit": {
      \   "Black":         { "hl24": "#07242c", "hl8": "Black"},
      \   "Red":           { "hl24": "#fc6195", "hl8": "DarkRed" },
      \   "Green":         { "hl24": "#5AC6A1", "hl8": "DarkGreen" },
      \   "Yellow":        { "hl24": "#fff1ac", "hl8": "DarkYellow" },
      \   "Blue":          { "hl24": "#296873", "hl8": "DarkBlue" },
      \   "Magenta":       { "hl24": "#85919b", "hl8": "DarkMagenta" },
      \   "Cyan":          { "hl24": "#04a7a7", "hl8": "DarkCyan" },
      \   "White":         { "hl24": "#c4c7c7", "hl8": "LightGray" },
      \   "BrightBlack":   { "hl24": "#142c35", "hl8": "Grey" },
      \   "BrightRed":     { "hl24": "#fc81a5", "hl8": "LightRed" },
      \   "BrightGreen":   { "hl24": "#233439", "hl8": "LightGreen" },
      \   "BrightYellow":  { "hl24": "#DF7353", "hl8": "LightYellow" },
      \   "BrightBlue":    { "hl24": "#6FaEaF", "hl8": "LightBlue" },
      \   "BrightMagenta": { "hl24": "#364f6b", "hl8": "LightMagenta" },
      \   "BrightCyan":    { "hl24": "#94e7e7", "hl8": "LightCyan" },
      \   "BrightWhite":   { "hl24": "#dafafc", "hl8": "White" },
      \ }}
]])

vim.cmd([[let g:chadtree_settings = {"theme.text_colour_set": "nerdtree_syntax_dark"}]])

vim.cmd([[
	hi Normal guibg=#222
	hi MatchParen ctermbg=green
highlight SignColumn guibg=#222
highlight LineNr guibg=#222 guifg=#222
set fillchars+=vert:\ 
]])
