if not pcall(require, "impatient") then
  print "impatient.nvim not found!"
end

if not pcall(package.path, ".. pack") then
  print('Kite does not exist')
end

require('user.globals.options')
require('user.globals.keymaps')
require('user.globals.plugins')
require('user.colorschemes')
require('user.commenter')
require('user.barbar')
require('user.indent-blankline')
require('user.lualine')
require('user.tree')
require('user.treesitter')
-- require('user.lsp')
