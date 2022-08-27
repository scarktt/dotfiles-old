
vim.g.mapleader = ' '

local os_name = os.execute('uname -a')

--vim.api.nvim_set_keymap('n', '<leader>1', '')

vim.keymap.set('n', '<leader>fs', "<cmd>w<cr>", { silent = true})
vim.keymap.set('n', '<leader>q', "<cmd>q<cr>", { silent = true})
vim.keymap.set('n', '<leader>qq', "<cmd>q!<cr>", { silent = true})
vim.keymap.set('n', '<leader>wh', "<cmd>split<cr>", { silent = true})
vim.keymap.set('n', '<leader>wv', "<cmd>vsplit<cr>", { silent = true})
vim.keymap.set('n', '<leader>th', "<cmd>split<cr> <cmd>te pwsh.exe<cr>", { silent = true})
vim.keymap.set('n', '<leader>tv', "<cmd>vsplit<cr> <cmd>te pwsh.exe<cr>", { silent = true})

-- reload config
vim.keymap.set('n', '<leader>rr', "<cmd>so %<cr>", { silent = true})

-- deselect macthing string after search
vim.keymap.set('n', '<leader>.', "<cmd>noh<cr>", { silent = true})

vim.keymap.set('n', '<leader>1', "<cmd>BufferPrevious<cr> <cmd>cd %:h<cr>", { silent = true})
vim.keymap.set('n', '<leader>bd', "<cmd>:BufferClose!<cr>", { silent = true})


-- files
-- open File Explorer in the current dir
if string.find(os_name, "linux") then
    vim.keymap.set('n', '<leader>f.', "<cmd>!open .<cr>", { silent = true})
else
    -- windows path
    vim.keymap.set('n', '<leader>f.', "<cmd>!start explorer /select,%:p<cr>", { silent = true})
end
