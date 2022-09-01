
return require('packer').startup(function(use)
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

end)
