local treesitter_status_ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if not treesitter_status_ok then
  return
end

treesitter.setup {
	ensure_installed = { "python", "javascript", "typescript", "vue", "css", "html", "json", "markdown", "regex", "vim", "yaml" },
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
	},
}
