vim.o.wrap = true
vim.o.textwidth = 79
vim.o.formatoptions = "qrn1"
vim.o.clipboard = "unnamedplus"
vim.o.relativenumber = true
vim.o.number = true
vim.o.backupdir = ".cache/vim"
vim.o.mouse = "v"
vim.o.mouse = "a"
vim.o.encoding = "UTF-8"
vim.o.shiftwidth = 4
vim.o.updatetime = 100
vim.o.scrolloff = 7
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.autoindent = true
vim.o.pyx = 3
vim.opt.termguicolors = true
vim.opt.list = true
vim.opt.listchars = { space = '⋅', tab = "| ", eol = '↴' }
vim.opt.guifont = { "Dank Mono", "h14" }

vim.cmd [[autocmd FileType javascript setlocal shiftwidth=2 tabstop=2]]
vim.cmd [[autocmd FileType html setlocal shiftwidth=2 tabstop=2]]
vim.cmd [[autocmd FileType css setlocal shiftwidth=2 tabstop=2]]
vim.cmd [[autocmd FileType lua setlocal shiftwidth=2 tabstop=2]]
vim.cmd [[autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4]]
--vim.cmd [[au FileType python let b:AutoPairs = AutoPairsDefine({"f'" : "'", "r'" : "'", "b'" : "'"})]]

--vim.g.did_load_filetypes = 1
--vim.g.loaded_python_provider = 0
--vim.g['python3_host_prog'] = "~/AppData/Local/Programs/Python/Python36/python.exe"  
