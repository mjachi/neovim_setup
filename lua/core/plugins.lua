local fn = vim.fn

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
    end,
  },
}

return packer.startup(function(use)

  use "wbthomason/packer.nvim"
  use "wakatime/vim-wakatime"
  use "kyazdani42/nvim-web-devicons"
  use "lewis6991/impatient.nvim"
  use "norcalli/nvim-colorizer.lua"

  use "shaunsingh/nord.nvim"
  -- https://github.com/sainnhe/everforest
  -- also morhetz/gruvbox

  use {
    'kyazdani42/nvim-tree.lua',
    cmd = {'NvimTreeToggle', 'NvimTreeOpen'},
    config = function()
      require('nvim-tree').setup { update_focused_file = {enable = true, update_cwd = true} }
    end
  }

  use {
		'lewis6991/gitsigns.nvim',
		event = { "CursorMoved", "CursorMovedI" },
		config = function()
			require("gitsigns")
		end
  }

  use {
    "williamboman/nvim-lsp-installer",
    {
      "neovim/nvim-lspconfig",
      config = function()
        require("nvim-lsp-installer").setup {}
        local lspconfig = require("lspconfig")
        end
    }
  }
  use "saadparwaiz1/cmp_luasnip"
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use "hrsh7th/cmp-nvim-lsp"
  use "L3MON4D3/LuaSnip"

  use "nvim-treesitter/nvim-treesitter"
  use "akinsho/nvim-toggleterm.lua"
  use "terrortylor/nvim-comment"

  use "nvim-lualine/lualine.nvim"
  use "goolord/alpha-nvim"
  use "karb94/neoscroll.nvim"

  use "JuliaEditorSupport/julia-vim"

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
