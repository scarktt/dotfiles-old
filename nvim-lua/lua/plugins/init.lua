
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

end)
