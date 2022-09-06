-- local is_ok, _ = pcall(require, 'tagbar')
-- if not is_ok then
--   return
-- end

vim.g.tagbar_ctags_bin = 'C:/Program Files (x86)/ctags58/'

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', '<F8>', '<cmd>TagbarToggle<cr>', opts)

