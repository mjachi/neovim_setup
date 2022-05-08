-------------------
-- Plugin Config --
-------------------
local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Reloads neovim this plugins.lua file is saved
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Packer things here and below
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)

-- Nvim Tree File Explorer
  use {
  'kyazdani42/nvim-tree.lua',
  cmd = {'NvimTreeToggle', 'NvimTreeOpen'},
  config = function()
    require('nvim-tree').setup {
      update_focused_file = {enable = true, update_cwd = true}
    }
  end
}
  use "wbthomason/packer.nvim"             -- Have packer manage itself
  use "nvim-treesitter/nvim-treesitter"    -- Treesitter interface
  use "nvim-lualine/lualine.nvim"          -- Better Status Line
  use "kyazdani42/nvim-web-devicons"       -- Cool Icons
  use "terrortylor/nvim-comment"           -- Nvim Comment
  use "lewis6991/gitsigns.nvim"            -- Git sings Git Diff...
  use "norcalli/nvim-colorizer.lua"        -- Colors
  use "shaunsingh/nord.nvim"               -- Nord Color Scheme
  use "goolord/alpha-nvim"                 -- Welcome Screen
  use "hrsh7th/nvim-cmp"                   -- Auto Complete
  use "hrsh7th/cmp-buffer"                 -- Buffer Completion
  use "hrsh7th/cmp-path"                   -- Path Completion
  use "L3MON4D3/LuaSnip"                   -- LuaSnip (requird by nvim-cmp)
  use "lewis6991/impatient.nvim"           -- Speed up loading Lua modules to improve startup time.
  use "karb94/neoscroll.nvim"              -- Smooth Scrolling
  use "lukas-reineke/indent-blankline.nvim"
  use "lervag/vimtex" -- LATEX

-- Automatically set up your configuration after cloning packer.nvim
-- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
