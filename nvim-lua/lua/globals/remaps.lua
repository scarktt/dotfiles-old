
vim.g.mapleader = ' '

local options = { noremap = true, silent = true }
local os_name = os.execute('uname -a')

vim.keymap.set('n', '<leader>fs', "<cmd>w<cr>", options)
vim.keymap.set('n', '<leader>q', "<cmd>q<cr>", options)
vim.keymap.set('n', '<leader>qq', "<cmd>q!<cr>", options)
vim.keymap.set('n', '<leader>wh', "<cmd>split<cr>", options)
vim.keymap.set('n', '<leader>wv', "<cmd>vsplit<cr>", options)
vim.keymap.set('n', '<leader>th', "<cmd>split<cr> <cmd>te pwsh.exe<cr>", options)
vim.keymap.set('n', '<leader>tv', "<cmd>vsplit<cr> <cmd>te pwsh.exe<cr>", options)

-- reload config
vim.keymap.set('n', '<leader>rr', "<cmd>so %<cr>", options)

-- deselect matching string after search
vim.keymap.set('n', '<leader>.', "<cmd>noh<cr>", options)

-- navigate buffers
vim.keymap.set('n', '<leader>1', "<cmd>BufferPrevious<cr> <cmd>cd %:h<cr>", options)
vim.keymap.set('n', '<leader>2', "<cmd>BufferNext<cr> <cmd>cd %:h<cr>", options)
vim.keymap.set('n', '<leader>bd', "<cmd>BufferClose!<cr>", options)
vim.keymap.set('n', '<leader>bp', "<cmd>BufferPin<cr>", options)
vim.keymap.set('n', '<leader><', "<cmd>BufferMovePrevious<cr>", options)
vim.keymap.set('n', '<leader>>', "<cmd>BufferMoveNext<cr>", options)

-- nvim-tree
vim.keymap.set('n', '<leader>n', "<cmd>NvimTreeToggle<cr>", options)

-- startify
vim.keymap.set('n', '<leader>gh', "<cmd><cr>", options)

-- nerdcomenter
vim.keymap.set('n', '<C-_>', "<Plug>NERDCommenterToggle", options)
vim.keymap.set('n', '<C-_>', "<Plug>NERDCommenterToggle<CR>gv", options)

-- files
-- open File Explorer in the current dir
if string.find(os_name, "linux") then
    vim.keymap.set('n', '<leader>f.', "<cmd>!open .<cr>", options)
else
    -- windows path
    vim.keymap.set('n', '<leader>f.', "<cmd>!start explorer /select,%:p<cr>", options)
end

