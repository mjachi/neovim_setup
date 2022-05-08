
-----------------------------------
-- Welcome Screen Configuration --
-----------------------------------

-- Call Alpha With A pcall
local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

-- Enable Alpha Dashboard
local dashboard = require("alpha.themes.dashboard")

-- Remove These ~ ~ ~
vim.opt.fillchars:append { eob = " " }

-- Disable Status Line so that alpha dashboard look nice
vim.cmd [[ au User AlphaReady if winnr('$') == 1 | set laststatus=1 ]]

-- Custom Footer
dashboard.section.footer.val = {
  "Write Programs That Do One Thing And Do It Well.",
}

-- Custom Section
dashboard.section.buttons.val = {
	dashboard.button("n", "  Create New file",       ":set laststatus=3 | :ene <BAR> startinsert <CR>"),
	dashboard.button("e", "  Open File Manager",     ":set laststatus=3 | :NvimTreeOpen <CR>"),
  dashboard.button("v", "  Neovim Settings ",      ":set laststatus=3 | e ~/.config/nvim/init.lua <CR>"),
	dashboard.button("s", "  Shell Configuration",   ":set laststatus=3 | e ~/.zshrc <CR>"),
	dashboard.button("u", "  Update Nvim Plugins",   ":PackerUpdate <CR>"),
	dashboard.button("q", "  Quit Neovim",           ":qa<CR>"),
}

dashboard.section.header.val = {
  [[    ______                   _   _      __            _ __     ___   _           ]],
  [[   / ____/___     ____ ___  (_)_(_)____/ /__   _   __(_) /_   / (_)_(_)___ _____ ]],
  [[  / __/ / __ \   / __ `__ \/ __ \/ ___/ //_/  | | / / / __/  / / __ \/ __ `/ __ \]],
  [[ / /___/ / / /  / / / / / / /_/ / /  / ,<     | |/ / / /_   / / /_/ / /_/ / / / /]],
  [[/_____/_/ /_/  /_/ /_/ /_/\____/_/  /_/|_|    |___/_/\__/  /_/\____/\__, /_/ /_/ ]],
  [[                                                                   /____/        ]],
}

alpha.setup(dashboard.opts)
