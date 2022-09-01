local cmp_status_ok, cmp = pcall(require, 'cmp')
if not cmp_status_ok then
    print("Couldn't load cmp " .. cmp, "error")
    return
end

local snip_status_ok, luasnip = pcall(require, 'luasnip')
if not snip_status_ok then
    print("Couldn't load luasnip " .. luasnip, "error")
    return
end

local lspkind_status_ok, lspkind = pcall(require, 'lspkind')
if not lspkind_status_ok then
    print("Couldn't load lspkind " .. lspkind, "error")
    return
end

cmp.setup({
    snippet = {
      expand = function(args)
		    luasnip.lsp_expand(args.body)
      end,
    },
	  formatting = {
	    format = lspkind.cmp_format({
	      mode = 'symbol_text',
	    preset = 'codicons',
	    symbol_map = {
		  Text = "",
		  Method = "",
		  Function = "",
		  Constructor = "",
		  Field = "ﰠ",
		  Variable = "",
		  Class = "ﴯ",
		  Interface = "",
		  Module = "",
		  Property = "ﰠ",
		  Unit = "塞",
		  Value = "",
		  Enum = "",
		  Keyword = "",
		  Snippet = "",
		  Color = "",
		  File = "",
		  Reference = "",
		  Folder = "",
		  EnumMember = "",
		  Constant = "",
		  Struct = "פּ",
		  Event = "",
		  Operator = "",
		  TypeParameter = ""
		},
	    })
	  },
    window = {
       completion = cmp.config.window.bordered(),
       documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = false }),

      ["<Tab>"] = cmp.mapping(function(fallback)
    if cmp.visible() then
      cmp.select_next_item()
    else
      fallback()
    end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function()
    if cmp.visible() then
            cmp.select_prev_item()
    end
    end, { "i", "s" }),

    }),
    sources = cmp.config.sources({
       { name = 'luasnip' },
    }, {
      { name = 'buffer' },
    })
  })

  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })
