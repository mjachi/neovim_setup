vim.g.nord_contrast = true
vim.g.nord_borders = true
vim.g.nord_disable_background = true
vim.g.nord_italic = true

-- Load the colorscheme
-- local colorscheme = "nord"
local colorscheme = "catppuccin"
vim.g.catppuccin_flavour = "mocha"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end
