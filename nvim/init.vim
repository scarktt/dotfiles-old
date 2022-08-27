 Run PlugInstall if there are missing plugins
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
	let $PATH = "C:\\Program Files\\Git\\usr\\bin;" . $PATH
	let plug_dir= $HOME . '\AppData\Local\nvim\plugged'
	let snips_dir= $HOME . '\AppData\Local\nvim\ultisnips'

	let g:python3_host_prog = expand($HOME . '\AppData\Local\Programs\Python\Python39\python.exe')
	"if has('python') == 0
		"let g:python3_host_prog = expand('C:\Users\Scarlett\AppData\Local\Microsoft\WindowsApps\PythonSoftwareFoundation.Python.3.9_qbz5n2kfra8p0\python.exe')
	"endif

	let g:startify_bookmarks = [
	\ {'v': $HOME . '\AppData\Local\nvim\init.vim'},
	\ {'d': $HOME . '\dotfiles'},
	\ {'p': $HOME . '\dev'},
	\ {'r': $WORK },
	\]
endif

"==============================================================================
"plugins
"==============================================================================
call plug#begin(plug_dir)

"   Themes & UI
Plug 'joshdick/onedark.vim'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'tiagovla/tokyodark.nvim'
Plug 'ashfinal/vim-one'
Plug 'glepnir/zephyr-nvim'
Plug 'marko-cerovac/material.nvim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ayu-theme/ayu-vim'
Plug 'EdenEast/nightfox.nvim', { 'tag': 'v1.0.0' }

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
Plug 'mhinz/vim-startify'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'dhruvmanila/telescope-bookmarks.nvim'
Plug 'itchyny/vim-external'
Plug 'nvim-lua/popup.nvim'
Plug 'jvgrootveld/telescope-zoxide'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }	
Plug 'junegunn/fzf.vim'	
Plug 'junegunn/goyo.vim'

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
Plug 'vim-test/vim-test'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'godlygeek/tabular'
Plug 'elzr/vim-json'
Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}
Plug 'ap/vim-css-color'

call plug#end()

"==============================================================================
"general
"==============================================================================
let mapleader = " "
let maplocalleader = " "
"set wrap linebreak nolist
set wrap
set textwidth=79
set formatoptions=qrn1
set sw=4
set clipboard=unnamed
set relativenumber
set number
set formatoptions-=cro
set backupdir=~/.cache/vim
"set cc=80
set mouse=v
set mouse=a
set noshowmode
set encoding=UTF-8
set guifont=*
set sw=4
set clipboard=unnamed
set updatetime=100
set scrolloff=7
set ignorecase
set splitbelow
set splitright
set autoindent

set pyx=3

syntax enable
filetype plugin indent on
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2	
autocmd FileType html setlocal shiftwidth=2 tabstop=2	
autocmd FileType css setlocal shiftwidth=2 tabstop=2	
autocmd FileType vim setlocal shiftwidth=2 tabstop=2	
autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4
au FileType python let b:AutoPairs = AutoPairsDefine({"f'" : "'", "r'" : "'", "b'" : "'"})
" font
"set guifont=Cascadia\ Code\ Italic:h11
set guifont=Dank\ Mono\ Italic:h12
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
nnoremap <leader>1 :BufferPrevious<CR> :cd %:h<CR>	
nnoremap <leader>2 :BufferNext<CR> :cd %:h<CR>	
nnoremap <leader>bd :BufferClose!<CR>
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
nnoremap <leader>th :split<CR> :te pwsh.exe<CR>
nnoremap <leader>tv :vsplit<CR> :te pwsh.exe<CR>

"   Reload Config
nmap <leader>rr :so %<CR>

"   Deselect macthing string after search
map <Leader>. :noh<CR>

"   Distraction free
nnoremap <leader>g :Goyo<CR>

" Replace all instances selected with *
nnoremap <Leader>r :%s///g<Left><Left>
" Replace all instances that are ONLY inside of visually selected range
xnoremap <Leader>r :s///g<Left><Left>

"   Terminal
tnoremap <Esc> <C-\><C-n>
tnoremap <silent>q <C-D><C-\><C-N>ZQ

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
	autocmd FileType javascript,typescript,json,yaml,python setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('sho SignatureHelp')
	" Execute python code
	autocmd FileType python nnoremap <buffer> <silent><F12> :w<CR> :!python %<CR>
	" Execute javascript code
	autocmd FileType javascript nnoremap <buffer> <silent><F12> :w<CR> :!node %<CR>
	" Execute lua code
	autocmd FileType lua nnoremap <buffer> <silent><F12> :w<CR> :!lua %<CR>
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
"Open File Explorer in the current dir
if has("unix")
  let s:uname = system("uname")
	" MacOS paths
  if s:uname == "Darwin\n"
	nmap <leader>f. :!open .<CR>
  endif
else
	" Windows paths
	nmap <leader>f. :!start explorer /select,%:p<CR>
endif
"   fzf
nnoremap <leader>ff :Files %:p:h<CR>
nnoremap <leader>fh :History<CR>
let g:fzf_layout = { 'down': '40%' }

"   Vim-Floaterm
nnoremap   <silent>   <F1>    :FloatermNew --height=0.3 --wintype=split pwsh.exe<CR>
nnoremap   <silent>   <F3>    :FloatermNew --height=0.3 --wintype=split ipython<CR>
nnoremap   <silent>   <F4>    :FloatermNew --wintype=float lazygit<CR>

"   Telescope
nnoremap <silent><C-P> :Telescope find_files<CR>
nnoremap <silent><C-B> :Telescope bookmarks<CR>
nnoremap <silent><C-Z> :Telescope zoxide list<CR>

" NERDCommenter
nmap <C-_> <Plug>NERDCommenterToggle
vmap <C-_> <Plug>NERDCommenterToggle<CR>gv

nnoremap <expr> <leader>n g:NERDTree.IsOpen() ? ':NERDTreeClose<CR>' : @% == '' ? ':NERDTree<CR>' : ':NERDTreeFind<CR>'

" Tests
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
"nmap <silent> <leader>g :TestVisit<CR>

" Markdown
nmap <silent> <leader>mp :MarkdownPreview<CR>
nmap <silent> <leader>mP :MarkdownPreviewStop<CR>
nmap <silent> <leader>mt :MarkdownPreviewToggle<CR>

" Emmet
"let g:user_emmet_mode='n'
let g:user_emmet_leader_key=','

let g:user_emmet_settings = {
\  'variables': {'lang': 'en', 'charset': 'UTF-8'},
\  'html': {
\    'default_attributes': {
\      'option': {'value': v:null},
\      'textarea': {'id': v:null, 'name': v:null, 'cols': 10, 'rows': 10},
\    },
\    'snippets': {
\      'html:5': "<!DOCTYPE html>\n"
\              ."<html lang=\"${lang}\">\n"
\              ."<head>\n"
\              ."\t<meta charset=\"${charset}\">\n"
\              ."\t<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n"
\              ."\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n"
\              ."\t<title></title>\n"
\              ."</head>\n"
\              ."<body>\n\t${child}|\n</body>\n"
\              ."</html>",
\    },
\  },
\}

" HTML & CSS
function! JumpToCSS()
  let id_pos = searchpos("id", "nb", line('.'))[1]
  let class_pos = searchpos("class", "nb", line('.'))[1]

  if class_pos > 0 || id_pos > 0
    if class_pos < id_pos
      execute ":vim '#".expand('<cword>')."' **/*.css"
    elseif class_pos > id_pos
      execute ":vim '.".expand('<cword>')."' **/*.css"
    endif
  endif
endfunction

nnoremap <silent> gs :call JumpToCSS()<CR>

" Python Import Sort
let g:vim_isort_map = '<C-i>'

"::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

" GUI SETTINGS
"   Themes
syntax on
"colorscheme onedark
"colorscheme tokyonight
"colorscheme onehalfdark
"colorscheme zephyr
"let g:material_style = "darker"
"colorscheme material
"colorscheme nightfox
colorscheme nordfox

"let ayucolor="light"
"let ayucolor="dark"
"colorscheme ayu

"hi Normal guibg=#11121D

"   Tabline and Statusline
"   	Lualine & Barbar
lua << EOF
require('lualine').setup {
  options = {
    icons_enabled = true,
		theme = 'onedark',
		-- theme = 'auto',
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

" Tests
let test#strategy = 'neovim'
let test#python#runner = 'pyunit'

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
"let g:UltisnipsExpandTrigger="<enter>"
"let g:UltisnipsJumpForwardTrigger="<enter>"
"let g:UltisnipsJumpBackwardTrigger="<s-enter>"

"lua <<EOF
"require'nvim-treesitter.configs'.setup {
	"ensure_installed = { "python", "javascript", "typescript", "vue", "css", "html", "json", "markdown", "regex", "vim", "yaml" },
	"sync_install = false,
  "auto_install = true,
	"highlight = {
		"enable = true,
		"--disable = { "lua" },
	"},
"}
"EOF

let g:startify_lists = [
\ {'header': ['    Bookmarks'],    'type': 'bookmarks' },
\ {'header': ['    Recent Files'], 'type': 'files'     },
\ {'header': ['    Sessions'],     'type': 'sessions'  },
\]


" Telescope
" Note: To fix the error: ... This extension doesn't exist or is not installed: fzf
" $ cd '.\AppData\Local\nvim\plugged\telescope-fzf-native.nvim\'
" $ mkdir build (if it doesn't exisit)
" $ gcc -O3 -Wall -Werror -fpic -shared src/fzf.c -o build/libfzf.dll
" https://github.com/LunarVim/LunarVim/issues/1804#issuecomment-1029464761
lua <<EOF
require("telescope").setup {
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case", -- this is default
    },
    file_browser = {
      hidden = true,
    },
    ["ui-select"] = {
      require("telescope.themes").get_cursor(),
    },
    bookmarks = {
      selected_browser = "brave",
      url_open_command = "open",
			url_open_plugin = "vim_external",
    },
  },
  defaults = {
    preview = {
      timeout = 500,
      msg_bg_fillchar = "",
    },
    multi_icon = " ",
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--hidden",
    },
    prompt_prefix = "❯ ",
    selection_caret = "❯ ",
    sorting_strategy = "ascending",
    color_devicons = true,
    layout_config = {
      prompt_position = "bottom",
      horizontal = {
        width_padding = 0.04,
        height_padding = 0.1,
        preview_width = 0.6,
      },
      vertical = {
        width_padding = 0.05,
        height_padding = 1,
        preview_height = 0.5,
      },
    },

    mappings = {
    },
    dynamic_preview_title = true,
    winblend = 4,
  },
}

-- Extensions
require('telescope').load_extension('fzf')
require('telescope').load_extension('bookmarks')
require('telescope').load_extension('zoxide')
EOF

" Text Conceal
set conceallevel=2
let g:tex_conceal="abdgm"
let g:tex_conceal_frac=1

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

"let g:startify_custom_header = [
"\'               _..------.._     ',
"\'            .-;"-._____..-";    ',
"\'           (( |            |    ',
"\'            `))            ;    ',
"\'             ` \          /     ',
"\'            .-- `|._____.|-.    ',
"\'           (     |------|     ) ',
"\'            `-=..________..--`  ',
"\]

let g:startify_custom_header = [
    \' ⣿⡇⣿⣿⣿⠛⠁⣴⣿⡿⠿⠧⠹⠿⠘⣿⣿⣿⡇⢸⡻⣿⣿⣿⣿⣿⣿⣿ ',
    \' ⢹⡇⣿⣿⣿⠄⣞⣯⣷⣾⣿⣿⣧⡹⡆⡀⠉⢹⡌⠐⢿⣿⣿⣿⡞⣿⣿⣿ ',
    \' ⣾⡇⣿⣿⡇⣾⣿⣿⣿⣿⣿⣿⣿⣿⣄⢻⣦⡀⠁⢸⡌⠻⣿⣿⣿⡽⣿⣿ ',
    \' ⡇⣿⠹⣿⡇⡟⠛⣉⠁⠉⠉⠻⡿⣿⣿⣿⣿⣿⣦⣄⡉⠂⠈⠙⢿⣿⣝⣿ ',
    \' ⠤⢿⡄⠹⣧⣷⣸⡇⠄⠄⠲⢰⣌⣾⣿⣿⣿⣿⣿⣿⣶⣤⣤⡀⠄⠈⠻⢮ ',
    \'   ⣧⠄⢘⢻⣿⡇⢀⣀⠄⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⡀⠄⢀ ',
    \'   ⣿⡆⢸⣿⣿⣿⣬⣭⣴⣿⣿⣿⣿⣿⣿⣿⣯⠝⠛⠛⠙⢿⡿⠃⠄⢸ ',
    \'   ⢿⣿⡀⣿⣿⣿⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣿⣿⣿⣿⡾⠁⢠⡇⢀ ',
    \'   ⢸⣿⡇⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣏⣫⣻⡟⢀⠄⣿⣷⣾ ',
    \'   ⢸⣿⡇⠄⠈⠙⠿⣿⣿⣿⣮⣿⣿⣿⣿⣿⣿⣿⣿⡿⢠⠊⢀⡇⣿⣿ ',
    \'    ⣿⡇⢀⡲⠄⠄⠈⠙⠻⢿⣿⣿⠿⠿⠟⠛⠋⠁⣰⠇ ⢸⣿⣿⣿ ',
    \'    ⣿⡇⢬⡻⡇⡄⠄⠄⠄⡰⢖⠔⠉⠄⠄⠄⠄⣼⠏  ⢸⣿⣿⣿ ',
    \'    ⣿⡇⠄⠙⢌⢷⣆⡀⡾⡣⠃⠄⠄⠄⠄⠄⣼⡟    ⢿⣿⣿ ',
  
