local status_ok, nts = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
  return
end

nts.setup {
  ensure_installed = "all",
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  }
}
