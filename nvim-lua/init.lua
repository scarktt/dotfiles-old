if not pcall(require, "impatient") then
  print "impatient.nvim not found!"
end

require('user.globals.options')
require('user.globals.keymaps')
require('user.globals.plugins')
require('user.colorschemes')
require('user.commenter')
require('user.dashboard')
require('user.barbar')
require('user.indent-blankline')
require('user.lualine')
require('user.notify')
require('user.project')
require('user.tree')
require('user.treesitter')

