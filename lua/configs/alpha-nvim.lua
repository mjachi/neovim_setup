local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end
local dashboard = require("alpha.themes.dashboard")

vim.opt.fillchars:append { eob = " " }
vim.cmd [[ au User AlphaReady if winnr('$') == 1 | set laststatus=1 ]]


dashboard.section.header.val = {
  [[    ______                   _   _      __            _ __     ___   _           ]],
  [[   / ____/___     ____ ___  (_)_(_)____/ /__   _   __(_) /_   / (_)_(_)___ _____ ]],
  [[  / __/ / __ \   / __ `__ \/ __ \/ ___/ //_/  | | / / / __/  / / __ \/ __ `/ __ \]],
  [[ / /___/ / / /  / / / / / / /_/ / /  / ,<     | |/ / / /_   / / /_/ / /_/ / / / /]],
  [[/_____/_/ /_/  /_/ /_/ /_/\____/_/  /_/|_|    |___/_/\__/  /_/\____/\__, /_/ /_/ ]],
  [[                                                                   /____/        ]],
}
dashboard.config.layout = {
  { type = "padding", val = 5 },
  dashboard.section.header,
  { type = "padding", val = 2 },
  dashboard.section.buttons,
  { type = "padding", val = 1 },
  dashboard.section.footer,
}

dashboard.section.buttons.val = {
	dashboard.button("n", "  Create New file",       ":set laststatus=3 | :ene <BAR> startinsert <CR>"),
	dashboard.button("e", "  Open File Manager",     ":set laststatus=3 | :NvimTreeOpen <CR>"),
  dashboard.button("v", "  Neovim Settings ",      ":set laststatus=3 | e ~/.config/nvim/init.lua <CR>"),
	dashboard.button("s", "  Shell Configuration",   ":set laststatus=3 | e ~/.zshrc <CR>"),
	dashboard.button("u", "  Update Nvim Plugins",   ":PackerSync <CR>"),
	dashboard.button("q", "  Quit Neovim",           ":qa<CR>"),
}

dashboard.section.footer.val = {
  "Write Programs That Do One Thing And Do It Well.",
}
alpha.setup(dashboard.opts)
