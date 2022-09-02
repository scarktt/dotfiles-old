local treesitter_status_ok, _ = pcall(require, 'nvim-treesitter')
if not treesitter_status_ok then
  return
end

local configs = require("nvim-treesitter.configs")
configs.setup {
	ensure_installed = { "python", "javascript", "typescript", "vue", "css", "html", "json", "markdown", "regex", "vim", "yaml" },
	sync_install = false,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = true,
	},
}

local compilers = require("nvim-treesitter.install")
compilers.compilers = { "clang", "gcc" }