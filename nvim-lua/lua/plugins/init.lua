local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return packer.startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- Colorschemes
	use 'tiagovla/tokyodark.nvim'
	use { "EdenEast/nightfox.nvim", tag = "v1.0.0" }

	use {'nvim-treesitter/nvim-treesitter', run = ":TSUpdate"}

	use 'kyazdani42/nvim-web-devicons'

	use 'tiagofumo/vim-nerdtree-syntax-highlight'

	-- Tabline & Statusline
	use 'nvim-lualine/lualine.nvim'
	use 'romgrk/barbar.nvim'

	use 'lukas-reineke/indent-blankline.nvim'

	use {'junegunn/fzf', run = "fzf#install()"}

	-- General
	use 'kyazdani42/nvim-tree.lua'
	
	use 'mhinz/vim-startify'

	-- Code
	use 'preservim/nerdcommenter'

	-- LSP
	use {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
		"williamboman/nvim-lsp-installer",
	}

	-- Completion
	use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
	use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
	use 'L3MON4D3/LuaSnip' -- Snippets plugin
	use 'onsails/lspkind-nvim'
	use 'ray-x/lsp_signature.nvim'

	use {
		"windwp/nvim-autopairs",
		config = function() require("nvim-autopairs").setup {} end
	}

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
