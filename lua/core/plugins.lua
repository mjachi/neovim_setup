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

  -- core
  use "wbthomason/packer.nvim"
  use "wakatime/vim-wakatime"
  use "lewis6991/impatient.nvim"

  -- purely visual, icons
  use "norcalli/nvim-colorizer.lua"
  use "kyazdani42/nvim-web-devicons"
  -- color schemes
  -- "shaunsingh/nord.nvim"; "sainnhe/everforest"
  -- "morhetz/gruvbox"; "folke/tokyonight.nvim"
  -- use "catppuccin/nvim"
  use "EdenEast/nightfox.nvim"
  use "nvim-treesitter/nvim-treesitter"
  use "lukas-reineke/indent-blankline.nvim"

  -- file tree
  use 'kyazdani42/nvim-tree.lua'

  -- git things
  use {
		'lewis6991/gitsigns.nvim',
		event = { "CursorMoved", "CursorMovedI" },
		config = function()
			require("gitsigns")
		end
  }

  -- LSP things/ completion
  use {
    "williamboman/nvim-lsp-installer",
    {
      "neovim/nvim-lspconfig",
      require("nvim-lsp-installer").setup {}
    }
  }
  use "saadparwaiz1/cmp_luasnip"
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use "hrsh7th/cmp-nvim-lsp"
  use "L3MON4D3/LuaSnip"
  use "folke/trouble.nvim"
  use "hrsh7th/cmp-nvim-lsp-signature-help"

  -- END OF LSP THINGS SO SO MANY

  use "karb94/neoscroll.nvim"
  use "stevearc/aerial.nvim"

  -- pairs
  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }
  -- Functionalities
  use "terrortylor/nvim-comment"
  use "akinsho/nvim-toggleterm.lua"
  use "nvim-lualine/lualine.nvim"
  use "b0o/incline.nvim"
  use "goolord/alpha-nvim"
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'simrat39/symbols-outline.nvim'

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
