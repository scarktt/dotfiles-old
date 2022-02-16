" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" OS Paths
if has("unix")
  let s:uname = system("uname")
	" MacOS paths
  if s:uname == "Darwin\n"
    let plug_dir='~/.config/nvim/plugged'
    let g:python3_host_prog = expand('/Library/Frameworks/Python.framework/Versions/3.9/bin/')
    let g:gitgutter_git_executable = "/usr/local/bin/git"
    let snips_dir='~/.config/nvim/ultisnips'

		let g:startify_bookmarks = [
		\ {'v': '~/.config/nvim/init.vim'},
		\ {'p': '~/development'},
		\]
  endif
else
	" Windows paths
	let plug_dir='~/AppData/Local/nvim/plugged'
	let snips_dir='~/AppData/Local/nvim/ultisnips'
	let g:python3_host_prog = expand('C:\Users\Scarlett\AppData\Local\Programs\Python\Python39\python.exe')

	let g:startify_bookmarks = [
	\ {'v': 'C:\Users\Scarlett\AppData\Local\nvim\init.vim'},
	\ {'d': 'C:\Users\Scarlett\dotfiles'},
	\ {'p': 'C:\Users\Scarlett\dev'},
	\]
endif

"==============================================================================
"plugins
"==============================================================================
call plug#begin(plug_dir)

"   Themes & UI
Plug 'joshdick/onedark.vim'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'ashfinal/vim-one'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'glepnir/zephyr-nvim'

"   Tabline & Statusline
Plug 'nvim-lualine/lualine.nvim'
Plug 'romgrk/barbar.nvim'

"   Functional
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'voldikss/vim-floaterm'
Plug 'windwp/vim-floaterm-repl'
Plug 'preservim/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-startify'

"   Code
Plug 'preservim/nerdcommenter'
"Plug 'sirver/ultisnips'
Plug 'Yggdroot/indentLine'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'jiangmiao/auto-pairs'
Plug 'glench/vim-jinja2-syntax'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mattn/emmet-vim'
Plug 'pangloss/vim-javascript'
Plug 'alvan/vim-closetag'
Plug 'easymotion/vim-easymotion'
Plug 'airblade/vim-gitgutter'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'tpope/vim-surround'

call plug#end()

"==============================================================================
"general
"==============================================================================
let mapleader = " "
let maplocalleader = " "
set wrap linebreak nolist
set number
set backupdir=~/.cache/vim
set cc=80
set mouse=v
set mouse=a
set noshowmode
set encoding=utf-8
set sw=4
set nowrap
set clipboard=unnamed
set updatetime=100
set scrolloff=7
set ignorecase
set splitbelow
set splitright
set autoindent

syntax enable
filetype plugin indent on
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType vim setlocal shiftwidth=2 tabstop=2
autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4
au FileType python let b:AutoPairs = AutoPairsDefine({"f'" : "'", "r'" : "'", "b'" : "'"})
" font
set guifont=JetBrainsMono\ NF:h14
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L
set cursorline
set t_Co=256

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif


"==============================================================================
"keybinding
"==============================================================================
" Move to previous/next
nnoremap <leader>1 :BufferPrevious<CR>
nnoremap <leader>2 :BufferNext<CR>
nnoremap <leader>bd :BufferClose<CR>
nnoremap <leader>bp :BufferPin<CR>
" Re-order to previous/next
nnoremap <leader>< :BufferMovePrevious<CR>
nnoremap <leader>> :BufferMoveNext<CR>

"   General Commands
nnoremap <leader>gh :Startify<CR>
nnoremap <leader>fs :w<CR>
noremap <leader>q :q<CR>
nnoremap <leader>qq :q!<CR>
nnoremap <leader>wv :vsplit<CR>
nnoremap <leader>ws :split<CR>
nnoremap <leader>te :split<CR> :te pwsh.exe<CR>

"   Reload Config
nmap <leader>rr :so %<CR>

"   Deselect macthing string after search
map <Leader>. :noh<CR>

"   Easy-motion
map <Leader> <Plug>(easymotion-prefix)
"       Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)
"       Move to line
map <Leader>l <Plug>(easymotion-bd-jk)
nmap <Leader>l <Plug>(easymotion-overwin-line)

"   Coc
"let g:coc_global_extensions = [ 'coc-pyright' ]
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent>ff :CocCommand formatJson.selected<CR>
"nnoremap   <silent>   <F5>    :CocCommand python.execInTerminal<CR>

augroup exe_code
  autocmd!
  " Setup formatexpr specified filetype(s).
	autocmd FileType typescript,json,yaml,python setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('sho SignatureHelp')
	" Execute python code
	autocmd FileType python nnoremap <buffer> <silent><F12> :sp<CR> :term python3 %<CR> :startinsert<CR>
	" Execute javascript code
	autocmd FileType javascript nnoremap <buffer> <silent><F12> :sp<CR> :term node %<CR> :startinsert<CR>
augroup end

"       completion
" use <tab> for trigger completion and navigate to the next complete item
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"       Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)

"   Files
"   Open Windows Explorer in the current dir
nmap <leader>f. :!start explorer /select,%:p<CR>
"   fzf
nmap <leader>ff :Files<CR>
nmap <leader>fh :History<CR>

"   Vim-Floaterm
nnoremap   <silent>   <F1>    :FloatermNew --height=0.3 --wintype=split pwsh.exe<CR>
nnoremap   <silent>   <F3>    :FloatermNew --height=0.3 --wintype=split ipython<CR>
nnoremap   <silent>   <F4>    :FloatermNew --wintype=float lazygit<CR>

"   Telescope
nnoremap <silent><C-P> :Telescope find_files<cr>

" NERDCommenter
nmap <C-_> <Plug>NERDCommenterToggle
vmap <C-_> <Plug>NERDCommenterToggle<CR>gv

nnoremap <expr> <leader>n g:NERDTree.IsOpen() ? ':NERDTreeClose<CR>' : @% == '' ? ':NERDTree<CR>' : ':NERDTreeFind<CR>'
"::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

" GUI SETTINGS
"   Themes
syntax on
"colorscheme onedark
"colorscheme tokyonight
"colorscheme onehalfdark
colorscheme zephyr

"   Tabline and Statusline
"   	Lualine & Barbar
lua << EOF
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'onedark',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
EOF

"Configure icons on the bufferline.
let bufferline = get(g:, 'bufferline', {})
let bufferline.icon_separator_active = '▎'
let bufferline.icon_separator_inactive = '▎'
let bufferline.icon_close_tab = ''
let bufferline.icon_close_tab_modified = '●'
let bufferline.icon_pinned = '車'

let g:indent_blankline_show_trailing_blankline_indent = v:false

lua << EOF
vim.opt.termguicolors = true

vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")

require("indent_blankline").setup {
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
}
EOF

" FUNCTIONAL
"   Git
"   Note: To use gitgutter in Windows Powershell it is needed the module posh-git
let g:gitgutter_async = 0
let g:gitgutter_enabled = 1
let g:gitgutter_signs = 1

" restore place in file from previous session
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" NERDTree
let g:NERDTreeMinimalUI=1
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name

autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" Ultisnips
" TODO: Fix trouble with coc auto completion on tab
"let g:UltiSnipsDirectories=[snips_dir]
"let g:UltisnipsExpandTrigger="<tab>"
"let g:UltisnipsJumpForwardTrigger="<tab>"
"let g:UltisnipsJumpBackwardTrigger="<s-tab>"

"lua <<EOF
"require'nvim-treesitter.configs'.setup {
  "ensure_installed = "all",
  "highlight = {
    "enable = true,
  "},
"}
"EOF

let g:startify_lists = [
\ {'header': ['    Bookmarks'],    'type': 'bookmarks' },
\ {'header': ['    Recent Files'], 'type': 'files'     },
\ {'header': ['    Sessions'],     'type': 'sessions'  },
\]


"let g:startify_custom_header = [
"\ '                                       ) (               ',
"\ '  _____         __   __        ______ (  )           _   ',
"\ ' / ____|       / _| / _|      |  ____| )(           | |  ', 
"\ '| |      ___  | |_ | |_  ___  | |__    _  _ __  ___ | |_ ',
"\ '| |     / _ \ |  _||  _|/ _ \ |  __|  | || `__|/ __|| __|',
"\ '| |____| (_) || |  | | |  __/ | |     | || |   \__ \| |_ ',
"\ ' \_____|\___/ |_|  |_|  \___| |_|     |_||_|   |___/ \__|',
"\ '',
"\ ]

let g:startify_custom_header = [
\'               _..------.._     ',
\'            .-;"-._____..-";    ',
\'           (( |            |    ',
\'            `))            ;    ',
\'             ` \          /     ',
\'            .-- `|._____.|-.    ',
\'           (     |------|     ) ',
\'            `-=..________..--`  ',
\]

