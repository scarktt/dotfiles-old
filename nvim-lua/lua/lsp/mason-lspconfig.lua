local mason_status_ok, mason = pcall(require, "mason")
if not mason_status_ok then
	print("Couldn't load Mason " .. mason, "error")
  return
end

local status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok then
  print('mason_lspconfig NOT OK')
  return
end

local lspconfig_status_ok, lsp_config = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  print("Couldn't load LSP-Config " .. lsp_config, "error")
  return
end

mason.setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗"
		}
	}
})
require("mason-lspconfig").setup()
require("mason-lspconfig").setup_handlers {
		function (server_name) -- default handler (optional)
				lsp_config[server_name].setup {
						on_attach = require("lsp.handlers").on_attach,
						capabilities = require("lsp.handlers").capabilities,
						root_dir = function()
							return vim.fn.getcwd()
						end,
						autostart = false,
				}
		end
}
