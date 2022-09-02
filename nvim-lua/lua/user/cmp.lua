local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
  return
end

local lspkind_ok, lspkind = pcall(require, 'lspkind')
if not lspkind_ok then
   return
end

local compare = require "cmp.config.compare"

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end
  },
  formatting = {
		fields = { "kind", "abbr", "menu" },
    format = lspkind.cmp_format({
      mode = 'symbol_text',
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
		{
      name = "nvim_lsp",
      filter = function(entry, ctx)
        local kind = require("cmp.types.lsp").CompletionItemKind[entry:get_kind()]
        if kind == "Snippet" and ctx.prev_context.filetype == "java" then
          return true
        end

        if kind == "Text" then
          return true
        end
      end,
      group_index = 2,
    },
    { name = "nvim_lua", group_index = 2 },
    { name = "luasnip", group_index = 2 },
    {
      name = "buffer",
      group_index = 2,
      filter = function(entry, ctx)
        if not contains(buffer_fts, ctx.prev_context.filetype) then
          return true
        end
      end,
    },
    { name = "cmp_tabnine", group_index = 2 },
    { name = "path", group_index = 2 },
  }),
	sorting = {
    priority_weight = 2,
    comparators = {
      compare.offset,
      compare.exact,
      compare.score,
      compare.recently_used,
      compare.locality,
      compare.sort_text,
      compare.length,
      compare.order,
    },
  },
})
