local fn = vim.fn

----------------------------------
-- Automatically install packer --
----------------------------------
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

-------------------------------
-- Auto-reload nvim whenever --
-- this file is saved.       --
-------------------------------
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

packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end
  },
}

----------------------------
-- Install packages below --
----------------------------

return packer.startup(function(use)

  use "wbthomason/packer.nvim"
  -- See e.g. :WakaTimeApiKey to set if it doesn't do auto.
  use "wakatime/vim-wakatime"
  use "kyazdani42/nvim-web-devicons"
  use "lewis6991/impatient.nvim"

  -- Colorschemes
  use "shaunsingh/nord.nvim"
  -- https://github.com/sainnhe/everforest
  -- also morhetz/gruvbox

  use {"neovim/nvim-lspconfig",
    requires = { 'williamboman/nvim-lsp-installer' },
    --config = [[require('config.nvim-lsp')]]
  }
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use "hrsh7th/nvim-cmp"
  use "L3MON4D3/Luasnip"
  use "nvim-treesitter/nvim-treesitter"
  use "terrortylor/nvim-comment"

  use "goolord/alpha-nvim"
  use {
    'kyazdani42/nvim-tree.lua',
    cmd = {'NvimTreeToggle', 'NvimTreeOpen'},
    config = function()
    require('nvim-tree').setup {
      update_focused_file = {enable = true, update_cwd = true}
    }
    end
  }
  use "nvim-lualine/lualine.nvim"
  use "norcalli/nvim-colorizer.lua"

  use "karb94/neoscroll.nvim"
  use "lukas-reineke/indent-blankline.nvim"
  

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
