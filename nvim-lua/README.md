# Neovim with Lua

## QuickStart
--------------------

- [Neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim) >= 0.7.2
- Some [Nerd Font](https://www.nerdfonts.com/)

### Try out this config

    git clone https://github.com/ssoteloserrano/dotfiles "$env:LOCALAPPDATA\nvim"

Then you can run your neovim.


## Project Layout
--------------------

    │   init.lua
    │
    └───lua
        └───user
            │   barbar.lua
            │   cmp.lua
            │   commenter.lua
            │   indent-blankline.lua
            │   lualine.lua
            │   tree.lua
            │   treesitter.lua
            │
            ├───colorschemes
            │       nordfox.lua
            │       tokyonight.lua
            │
            ├───globals
            │       keymaps.lua
            │       options.lua
            │       plugins.lua
            │
            └───lsp
                │   handlers.lua
                │   init.lua
                │   mason-lspconfig.lua
                │
                └───settings
                        jsonls.lua
                        pyright.lua
                        sumneko_lua.lua

## Plugins list
--------------------

-  Re-orderable, auto-sizing, clickable tabs, icons and more with Barbar