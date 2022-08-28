
return require('packer').startup(function(use)
    -- packer can manage itself
    use 'wbthomason/packer.nvim'

    -- colorscheme
    use 'tiagovla/tokyodark.nvim'

    use {'nvim-treesitter/nvim-treesitter', run = ":TSUpdate"}

    use 'kyazdani42/nvim-web-devicons'

    use 'tiagofumo/vim-nerdtree-syntax-highlight'

    -- Tabline & Statusline
    use 'nvim-lualine/lualine.nvim'
    use 'romgrk/barbar.nvim'

    use 'lukas-reineke/indent-blankline.nvim'

    use {'junegunn/fzf', run = "fzf#install()"}

    -- use 'preservim/nerdtree'

    use {
      'kyazdani42/nvim-tree.lua',
      requires = {
	'kyazdani42/nvim-web-devicons', -- optional, for file icons
      },
      tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }

end)
