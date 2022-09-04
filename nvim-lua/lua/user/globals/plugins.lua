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
	use( "wbthomason/packer.nvim")

	use 'nathom/filetype.nvim'
	use 'lewis6991/impatient.nvim'
  use { "nvim-lua/plenary.nvim", module = "plenary" }

	-- Colorschemes
	use 'tiagovla/tokyodark.nvim'
	use { "EdenEast/nightfox.nvim", tag = "v1.0.0" }
	use 'xiyaowong/nvim-transparent'

	use { 
		'neoclide/coc.nvim',
		branch = 'release',
		config = function()
			vim.cmd [[let b:coc_suggest_disable = 1]]
		end
	}

	-- Treesitter for lnaguage highlighting
	use {'nvim-treesitter/nvim-treesitter', run = ":TSUpdate"}

	-- Icons
	use 'kyazdani42/nvim-web-devicons'

	-- Barbar for buffers navigation and tabline
	use 'romgrk/barbar.nvim'

	-- Luanine for statusline
	use 'nvim-lualine/lualine.nvim'

	-- Indent blankline for indentation guides
	use 'lukas-reineke/indent-blankline.nvim'

	-- fzf for file search and much more
	-- use {'junegunn/fzf', run = "fzf#install()"}

	-- Nvim tree for file explorer within nvim
	use 'kyazdani42/nvim-tree.lua'

	-- Commenter
	use "terrortylor/nvim-comment"

	-- LSP
    -- use 'neovim/nvim-lspconfig'
	-- use {
	-- 	"williamboman/mason.nvim",
	-- 	"williamboman/mason-lspconfig.nvim",
	-- 	"neovim/nvim-lspconfig",
	-- 	"williamboman/nvim-lsp-installer",
	-- }

	-- Completion
-- 	use {
--     'hrsh7th/nvim-cmp',
--     requires = {
--       'hrsh7th/cmp-nvim-lsp',
--       {
--         "L3MON4D3/LuaSnip",
--         requires = { "rafamadriz/friendly-snippets" },
--         config = function()
--           require("luasnip.loaders.from_vscode").lazy_load()
--         end,
--       },
--       { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
--       { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
--       { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' },
--     },
--     config = [[require('user.cmp')]],
--     event = 'InsertEnter *',
--   }
-- 	use {'tzachar/cmp-tabnine', after = "nvim-cmp", run='powershell ./install.ps1', requires = 'hrsh7th/nvim-cmp'}

--   use {
--     'onsails/lspkind-nvim',
--     config = function()
--       require("lspkind").init()
--     end,
--   }

--   use 'ray-x/lsp_signature.nvim'

  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }

  -- git
  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('user.gitsigns')
    end,
  }


  use {
    "nvim-telescope/telescope.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require('user.telescope')
    end,
  }

  use {
    "nvim-telescope/telescope-fzf-native.nvim",
    run = "make",
  }
	
  if PACKER_BOOTSTRAP then
      require("packer").sync()
  end
end)
