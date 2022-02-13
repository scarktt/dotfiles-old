" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" Windows paths
let plug_dir='~/AppData/Local/nvim/plugged'
let snips_dir='~/AppData/Local/nvim/ultisnips'
let g:python3_host_prog = expand('C:\Users\Scarlett\AppData\Local\Programs\Python\Python39\python.exe')

" UNIX paths
if has("unix")
  let s:uname = system("uname")
  if s:uname == "Darwin\n"
    let plug_dir='~/.config/nvim/plugged'
    let g:python3_host_prog = expand('/Library/Frameworks/Python.framework/Versions/3.9/bin/')
    let g:gitgutter_git_executable = "/usr/local/bin/git"
    let snips_dir='~/.config/nvim/ultisnips'
  else
    let plug_dir='~/.config/nvim/plugged'
    let snips_dir='~/.config/nvim/ultisnips'
  endif
endif

call plug#begin(plug_dir)

"PLUGINS
"   Themes
Plug 'joshdick/onedark.vim'
Plug 'ashfinal/vim-one'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

"   UI Looks
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

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
Plug 'sirver/ultisnips'
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

call plug#end()


"::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

"BASIC CONFIG
let mapleader = " "
let g:indentLine_leadingSpaceChar='·'
let g:indentLine_leadingSpaceEnabled='1'
set wrap linebreak nolist
set number
"set relativenumber
set backupdir=~/.cache/vim
set cc=80
set mouse=v
set list lcs=eol:⏎,trail:·,tab:»·
set mouse=a
set noshowmode
syntax enable
set encoding=utf-8
set sw=4
set nowrap
"set noswapfile
set clipboard=unnamed
"set timeoutlen=300
set updatetime=100
set scrolloff=7
set ignorecase
" natural split settings
set splitbelow
set splitright
filetype plugin indent on
set autoindent
autocmd FileType vue setlocal shiftwidth=2 tabstop=2
autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4
" auto-pairs
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


"::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

" GUI SETTINGS
"   Themes
syntax on
"colorscheme onedark
colorscheme onehalfdark
"let g:airline_theme='onedark'
"let g:airline_theme='deus'
let g:airline_theme='badwolf'
let g:airline_section_z = "%p%% : \ue0a1:%l/%L"
let g:airline#extensions#whitespace#enabled = 0
let g:airline_section_warning=""

"   Tabs
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemode=':t'
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_right_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_left_alt_sep= ' '
let g:airline_left_sep = ' '
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = ' '
nmap <leader>1 :bp<CR>
nmap <leader>2 :bn<CR>
nmap <leader>bd :bd<CR>

" FUNCTIONAL
"   General Commands
nnoremap <leader>fs :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>qq :q!<CR>
nnoremap <leader>wv :vsplit<CR>
nnoremap <leader>ws :split<CR>
nnoremap <leader>te :split<CR> :te pwsh.exe<CR>
" move through split windows
"nmap <leader>k :wincmd k<CR>
"nmap <leader>j :wincmd j<CR>
"nmap <leader>h :wincmd h<CR>
"nmap <leader>l :wincmd l<CR>

"   Reload Config
nmap <leader>rr :so %<CR>

"   Git
"let g:gitgutter_git_executable = "C:/Program Files/Git/bin/git.exe"
"let g:gitgutter_git_executable = "~/Git/bin/git.exe"
let g:gitgutter_async = 0
let g:gitgutter_enabled = 1
let g:gitgutter_signs = 1

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

" restore place in file from previous session
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"   Coc
"let g:coc_global_extensions = [ 'coc-pyright' ]
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json,yaml,python setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

"nnoremap   <silent>   <F5>    :CocCommand python.execInTerminal<CR>
"       completion
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

" NERDTree
let g:NERDTreeMinimalUI=1
noremap <leader>n :NERDTreeToggle<cr>
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name

autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" Ultisnips
let g:UltiSnipsDirectories=[snips_dir]
let g:UltisnipsExpandTrigger="<tab>"
let g:UltisnipsJumpForwardTrigger="<tab>"
let g:UltisnipsJumpBackwardTrigger="<s-tab>"

" Vue
let g:vim_vue_plugin_config = { 
      \'syntax': {
      \   'template': ['html'],
      \   'script': ['javascript'],
      \   'style': ['css'],
      \},
      \'full_syntax': [],
      \'initial_indent': [],
      \'attribute': 0,
      \'keyword': 0,
      \'foldexpr': 0,
      \'debug': 0,
      \}

function! OnChangeVueSyntax(syntax)
  echom 'Syntax is '.a:syntax
  if a:syntax == 'html'
    setlocal commentstring=<!--%s-->
    setlocal comments=s:<!--,m:\ \ \ \ ,e:-->
  elseif a:syntax =~ 'css'
    setlocal comments=s1:/*,mb:*,ex:*/ commentstring&
  else
    setlocal commentstring=//%s
    setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,://
  endif
endfunction

"https://patorjk.com/software/taag/#p=display&h=1&v=1&f=ANSI%20Shadow&t=Pythonic%20Mode
let g:startify_custom_header = [
\ '',
\ '     ▓▓▓▓▓▓▓       ',
\ '    ▓▄▓▓▓▓▓▓▓      ',
\ '        ▓▓▓▓▓  ▒▒      ██████╗ ██╗   ██╗████████╗██╗  ██╗ ██████╗ ███╗   ██╗██╗ ██████╗    ███╗   ███╗ ██████╗ ██████╗ ███████╗',
\ '   ▓▓▓▓▓▓▓▓▓   ▒▒▒▒    ██╔══██╗╚██╗ ██╔╝╚══██╔══╝██║  ██║██╔═══██╗████╗  ██║██║██╔════╝    ████╗ ████║██╔═══██╗██╔══██╗██╔════╝',
\ '  ▓▓▓▓▓▓      ▒▒▒▒▒▒   ██████╔╝ ╚████╔╝    ██║   ███████║██║   ██║██╔██╗ ██║██║██║         ██╔████╔██║██║   ██║██║  ██║█████╗  ',
\ '   ▓▓▓▓   ▒▒▒▒▒▒▒▒▒▒   ██╔═══╝   ╚██╔╝     ██║   ██╔══██║██║   ██║██║╚██╗██║██║██║         ██║╚██╔╝██║██║   ██║██║  ██║██╔══╝  ',
\ '    ▓▓▓ ▒▒▒▒▒          ██║        ██║      ██║   ██║  ██║╚██████╔╝██║ ╚████║██║╚██████╗    ██║ ╚═╝ ██║╚██████╔╝██████╔╝███████╗',
\ '        ▒▒▒▒▒▒▀▒       ╚═╝        ╚═╝      ╚═╝   ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝ ╚═════╝    ╚═╝     ╚═╝ ╚═════╝ ╚═════╝ ╚══════╝',
\ '         ▒▒▒▒▒▒     ',
\ '',
\ '',
\ ]


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

