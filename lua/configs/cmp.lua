-------------------------------
-- Nvim cmp completion; note --
-- this is integrated with   --
-- LuaSnips                  --
-------------------------------

local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok, then
  return
end

local snip_status_ok, snip = pcall(require, "luasnip")
if not snip_status_ok, then
  return
end

---------------------------------------------
-- See https://github.com/hrsh7th/nvim-cmp --
---------------------------------------------
cmp.setup({
  -- Spec snippets engine
  snippet = {
    expand = function(args)
      snip.lsp_expand(args.body)
    end,
  },
  -- Set e.g. window size for completions, etc
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  -- Keymaps.
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
  })
})
---------------------------------------
-- Below, specify filetype specifics --
-- e.g. what to parse                --
---------------------------------------
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' },
  }, {
    { name = 'buffer' }
  })
})
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources( {
    { name = 'buffer' }
  })
})
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' },
  }, {
    { name = 'cmdline' }
  })
})
