
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

local lspsignature_status_ok, lspsignature = pcall(require, "lsp_signature")
if not lspconfig_status_ok then
  print("Couldn't load lsp_signature " .. lspsignature, "error")
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

mason_lspconfig.setup({
	ensure_installed = { "pyright", "pylsp" }
})

-- Mappings.
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

local on_attach = function(client, bufnr)
  lspsignature.on_attach({
    bind = true,
    floating_window = false,
    handler_opts = {
      border = "single"
    }
  }, bufnr)

  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end

local M = {}

-- TODO: backfill this to template
M.setup = function()
  local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  local config = {
    -- disable virtual text
    virtual_text = false,
    -- show signs
    signs = {
      active = signs,
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(config)

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
  })
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local cmp_nvim_lsp_status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status_ok then
  return
end

M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

 --Add additional capabilities supported by nvim-cmp
--local capabilities = vim.lsp.protocol.make_client_capabilities()
--capabilities.textDocument.completion.completionItem.snippetSupport = true
--capabilities.textDocument.completion.completionItem.resolveSupport = {
	--properties = {
		--"detail",
		--"documentation",
		--"additionalTextEdits",
	--},
--}
--capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

function specific_language_config(server_name)
	if string.find(server_name, "lua") then
		format = {
			enable = true,
			defaultConfig = {
				indent_style = "space",
				indent_size = "2",
			}
		}
	else
		format = {
			enable = true,
			defaultConfig = {
				indent_style = "space",
				indent_size = "4",
			}
		}
	end

	return format
end

for _, server in ipairs(mason_lspconfig.get_installed_servers()) do
	--print('Iterating servers: ' .. server)
	lsp_config[server].setup {
		on_attach = M.on_attach,
		capabilities = M.capabilities,
		root_dir = function()
			return vim.fn.getcwd()
		end,
		autostart = false,
		format = specific_language_config(server),
	}
end

