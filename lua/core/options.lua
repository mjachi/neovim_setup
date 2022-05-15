-------------
-- General --
-------------
local set = vim.opt
set.swapfile = false
set.updatetime = 0
set.encoding = "utf-8"
set.fileencoding = "utf-8"
set.clipboard = "unnamedplus"
set.smarttab = true
set.expandtab = true
set.autoindent = true
set.incsearch = true
set.shell = "/bin/zsh"
set.shortmess:append "sI"

vim.cmd [[set nobackup]]
vim.cmd [[set nocompatible]]
vim.cmd [[set completeopt=menuone,longest]]
vim.cmd [[set complete+=kspell]]
vim.cmd [[set formatoptions-=cro]]

---------------
-- Neovim UI --
---------------
set.number = true
set.relativenumber = true
set.pumheight = 15
set.ruler = true
set.splitbelow = true
set.splitright = true
set.tabstop = 2
set.ignorecase = true
set.smartcase = true
set.termguicolors = true
set.laststatus = 3
set.title = true
set.background = "dark"
set.cursorline = true
set.shiftwidth = 2
set.showtabline = 1
set.cmdheight = 1
set.numberwidth = 5
vim.cmd [[set noshowmode]]
vim.cmd [[syntax enable]]
vim.cmd [[set t_Co=256]]

---------------
-- For speed --
---------------

set.hidden = true
set.timeoutlen = 500
set.lazyredraw = true
set.synmaxcol = 240
set.updatetime = 700


