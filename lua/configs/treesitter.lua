local status_ok, nts = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
  return
end

nts.setup {
  ensure_installed = "all",
  sync_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  }
}

vim.opt.list = true

require ("indent_blankline").setup {
  space_char_blankline = " ",
  show_current_context = true,
  show_current_context_start = true,
}
