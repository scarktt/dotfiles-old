
return require('packer').startup(function(use)
    -- packer can manage itself
    use 'wbthomason/packer.nvim'

    -- colorschemes
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

    use {
	'kyazdani42/nvim-tree.lua',
	requires = {
	    'kyazdani42/nvim-web-devicons',
	},
    }

    use 'mhinz/vim-startify'

end)
