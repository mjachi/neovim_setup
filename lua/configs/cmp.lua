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

----------------------------------------------------------------------------------
-- See https://github.com/hrsh7th/nvim-cmp                                      --
-- https://github.com/LunarVim/Neovim-from-scratch/blob/master/lua/user/cmp.lua --
----------------------------------------------------------------------------------

require("luasnip/loaders/from_vscode").lazy_load()

local check_backspace = function()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

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
  mapping = {
    ["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    ["<C-y>"] = cmp.config.disable,
    ["<C-e>"] = cmp.mapping {
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    },
    ["<CR>"] = cmp.mapping.confirm { select = true },
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expandable() then
        luasnip.expand()
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
    }),
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
  },
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
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' }
  }),
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },
  documentation = {
    border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
  },
  completion = {
    border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
  },
  experimental = {
    ghost_text = false,
    native_menu = false,
  },
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
----------------------
-- Language servers --
----------------------
local lspc_status_ok, lspc = pcall(require, 'lspconfig')
if not lspc_status_ok, then
  return
end

-- handlers to redefine function configs
local handlers =  {
  ["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = "rounded"}),
}

-- helper function to attach signature
local on_attach_lsp_signature = function(client, bufnr)
  require('lsp_signature').on_attach({
      bind = true, -- This is mandatory, otherwise border config won't get registered.
      floating_window = true, -- false for virtual text only
      floating_window_above_cur_line = true,
      -- floating_window_off_y = 30,
      transparency = 20,
      handler_opts = {
        border = "rounded"
      },
      doc_lines = 2,   -- restrict documentation shown
      zindex = 50,     -- <=50 so that it does not hide completion preview.
      fix_pos = false, -- Let signature window change its position when needed
      toggle_key = '<A-x>',  -- Press <Alt-x> to toggle signature on and off.
    })
end

-- attach only after lsp connects
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- disable nvim-lsp formatting; use null-ls for formatting
  client.resolved_capabilities.document_formatting = false
  client.resolved_capabilities.document_range_formatting = false

  -- Activate LSP signature on attach.
  on_attach_lsp_signature(client, bufnr)

  -- Mappings.
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<Leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<Leader>ca', ':CodeActionMenu<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<Leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '<Leader>k', '<cmd>lua vim.diagnostic.goto_prev({float={border="rounded"}})<CR>', opts)
  buf_set_keymap('n', '<Leader>j', '<cmd>lua vim.diagnostic.goto_next({float={border="rounded"}})<CR>', opts)
  buf_set_keymap('n', '<Leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  buf_set_keymap('n', '<Leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

  -- Highlight symbol under cursor
  if client.resolved_capabilities.document_highlight then
    vim.cmd [[
      hi LspReferenceRead guifg=bg guibg=Gray
      hi LspReferenceText guifg=bg guibg=Gray
      hi LspReferenceWrite guifg=bg guibg=Gray
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]]
  end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local servers = {
  "texlab",
  "clangd",
  "gopls", 
  "jedi_language_server", 
  "pyright"
}
for _, lsp in pairs(servers) do
  lspc[lsp].setup {
    on_attach = on_attach,
    handlers = handlers,
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 150,
    }
  }
end


