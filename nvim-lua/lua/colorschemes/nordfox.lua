
require('nightfox').setup({
  options = {
    transparent = false,
    terminal_colors = true,
    styles = {
      comments = "italic",
      keywords = "bold",
      types = "italic,bold",
    }
  }
})

vim.cmd("colorscheme nordfox")