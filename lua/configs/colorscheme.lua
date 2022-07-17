-- Author: Matthew Meeker

-- Using catppuccin colorscheme
local catp = require("catppuccin")

catp.setup({
  styles = {
    comments = "italic",
    conditionals = "italic",
    loops = "NONE",
    functions = "bold",
    keywords = "bold",
    strings = "italic",
    variables = "italic",
    numbers = "NONE",
    booleans = "NONE",
    properties = "NONE",
    types = "NONE",
    operators = "NONE",
  },
  integrations = {
    treesitter = true,
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = "italic",
        hints = "italic",
        warnings = "italic",
        information = "italic",
      },
      underlines = {
        errors = "underline",
        hints = "underline",
        warnings = "underline",
        information = "underline",
      },
    },
    lsp_trouble = true,
    cmp = true,
    gitsigns = true,
    nvimtree = {
      enabled = true,
      show_root = true,
      transparent_panel = false,
    },
    indent_blankline = {
      enabled = true,
      colored_indent_levels = false,
    },
  },
  bufferline = true,
})


vim.g.catppuccin_flavour = "mocha"
local status_ok, _ = pcall(vim.cmd, "colorscheme catppuccin")
if not status_ok then
  return
end
