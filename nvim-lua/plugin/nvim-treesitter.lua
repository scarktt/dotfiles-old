
require'nvim-treesitter.configs'.setup {
	ensure_installed = { "python", "javascript", "typescript", "vue", "css", "html", "json", "markdown", "regex", "vim", "yaml" },
	sync_install = false,
  	auto_install = true,
	highlight = {
		enable = true,
	},
}
