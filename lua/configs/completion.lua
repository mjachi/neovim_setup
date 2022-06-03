local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end
local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
  return
end
require("luasnip/loaders/from_snipmate").lazy_load()
local lsp_status_ok, lspc = pcall(require, "lspconfig")
if not lsp_status_ok then
  return
end
local lspi_status_ok, lspi = pcall(require, "nvim-lsp-installer")
if not lspi_status_ok then
  return
end

lspi.setup { automatic_installation = true }

local check_backspace = function()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

--   פּ ﯟ   some other icons
local kind_icons = {
  Text = "",
  Method = "m",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "",
}


cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  window = {
    completion = {
      cmp.config.window.bordered(),
    },
    documentation = {
      cmp.config.window.bordered(),
    }
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), {"i", "c"}),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), {"i", "c"}),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
    ['<C-y>'] = cmp.config.disable,
    ['<C-e>'] = cmp.mapping {
      i = cmp.mapping.abort(),
      c = cmp.mapping.close()
    },
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
    ['<TAB>'] = cmp.mapping(
      function(fallback)
        if luasnip.expandable() then
          luasnip.expand()
        elseif cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif check_backspace() then
          fallback()
        else
          fallback()
        end
      end, {
        "i",
        "s",
      }
    ),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
  }),
    formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
      vim_item.menu = ({
        nvim_lsp = "[LSP]",
        luasnip = "[Snippet]",
        buffer = "[Buffer]",
        path = "[Path]",
      })[entry.source.name]
      return vim_item
    end,
  },
  sources = cmp.config.sources({
    -- { name = "copilot" },
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
    { name = 'path' }
  }),

})

cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' },
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

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local servers = { "asm_lsp",
  "ocamllsp",
  "texlab",
  "rust_analyzer",
  "clangd",
  "pyright",
  "julials",
  "solang",
  "solc",
  "cmake",
  "zk",
  "hls",
  "sumneko_lua",
}
-- local servers = require("nvim-lsp-installer.servers").get_installed_servers() -- TODO this returns []?
-- local servers = vim.cmd("LspPrintInstalled")

for _, lsp in pairs(servers) do
  lspc[lsp].setup {
    capabilities = capabilities
  }
end
