
vim.g.mapleader = ' '

local options = { noremap = true, silent = true }
local os_name = os.execute('uname -a')

-- navigate windows
vim.keymap.set('n', '<c-k>', "<cmd>wincmd k<cr>", options)
vim.keymap.set('n', '<c-j>', "<cmd>wincmd j<cr>", options)
vim.keymap.set('n', '<c-h>', "<cmd>wincmd h<cr>", options)
vim.keymap.set('n', '<c-l>', "<cmd>wincmd l<cr>", options)

-- split windows
vim.keymap.set('n', '<leader>wh', "<cmd>split<cr>", options)
vim.keymap.set('n', '<leader>wv', "<cmd>vsplit<cr>", options)
vim.keymap.set('n', '<leader>th', "<cmd>split<cr> <cmd>te pwsh.exe<cr>", options)
vim.keymap.set('n', '<leader>tv', "<cmd>vsplit<cr> <cmd>te pwsh.exe<cr>", options)

-- save and quite
vim.keymap.set('n', '<leader>fs', "<cmd>w<cr>", options)
vim.keymap.set('n', '<leader>q', "<cmd>q<cr>", options)
vim.keymap.set('n', '<leader>qq', "<cmd>q!<cr>", options)

-- reload config
vim.keymap.set('n', '<leader>rr', "<cmd>luafile %<cr>", options)

-- deselect matching string after search
vim.keymap.set('n', '<leader>.', "<cmd>noh<cr>", options)

-- startify
-- vim.keymap.set('n', '<leader>gh', "<cmd><cr>", options)

-- files
-- open File Explorer in the current dir
if string.find(os_name, "linux") then
    vim.keymap.set('n', '<leader>f.', "<cmd>!open .<cr>", options)
else
    -- windows path
    vim.keymap.set('n', '<leader>f.', "<cmd>!start explorer /select,%:p<cr>", options)
end

