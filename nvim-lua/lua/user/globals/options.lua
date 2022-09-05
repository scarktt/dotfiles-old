local g = vim.g
local opt = vim.opt

g.mapleader = ' '

opt.mouse = 'a'
opt.wrap = true
opt.hidden = true
opt.number = true
opt.scrolloff = 9 
opt.numberwidth = 2
-- opt.showmode = false 
-- opt.cursorline = true
opt.signcolumn = 'yes:1'
opt.termguicolors = true
opt.relativenumber = true
opt.clipboard = "unnamedplus"

-- opt.timeoutlen = 250
-- opt.updatetime = 250
-- opt.ttimeoutlen = 10
opt.updatetime = 300 
  
opt.splitbelow = true
opt.splitright = true
opt.tabstop = 4
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
opt.smarttab = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.inccommand = "nosplit"
opt.pumheight = 10
opt.completeopt = "menuone,noinsert,noselect" 
opt.swapfile = false
opt.undofile = true
opt.backup = false
opt.writebackup = false
opt.guifont = "FiraCode Nerd Font:h12"
vim.opt.list = true
vim.opt.listchars = { space = '⋅', tab = "| ", eol = '↴' }
-- vim.opt.guifont = { "Dank Mono", "h14" }

g.did_load_filetypes = 1
g.loaded_python_provider = 0
g['python3_host_prog'] = "C:/Users/Scarlett/AppData/Local/Programs/Python/Python39/python.exe"  

-- local disabled_built_ins = {
--     'netrw',
--     'netrwPlugin',
--     'netrwSettings',
--     'netrwFileHandlers',
--     'gzip',
--     'zip',
--     'zipPlugin',
--     'tar',
--     'tarPlugin',
--     'getscript',
--     'getscriptPlugin',
--     'vimball',
--     'vimballPlugin',
--     '2html_plugin',
--     'logipat',
--     'rrhelper',
--     'spellfile_plugin',
--     'matchit',
-- }

-- for _, plugin in pairs(disabled_built_ins) do
-- g['loaded_' .. plugin] = 1
-- end


-- vim.cmd [[autocmd FileType javascript setlocal shiftwidth=2 tabstop=2]]
-- vim.cmd [[autocmd FileType html setlocal shiftwidth=2 tabstop=2]]
-- vim.cmd [[autocmd FileType css setlocal shiftwidth=2 tabstop=2]]
-- vim.cmd [[autocmd FileType lua setlocal shiftwidth=2 tabstop=2]]
-- vim.cmd [[autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4]]

