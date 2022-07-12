# my neovim setup

## installation
- NerdFont, possibly

## todo's

- LaTeX needs a more complete setup.
  - Would like to be able to have something like a fully featured plugin, but nothing
  will fit in well with current setup... likely to use `ftplugin` for this.
  - LSP support is already there, but for e.g. plugging directly into zathura.
- WIP -- wanted a cleaner search and replace than what (neo)vim natively offers. See `lua/configs/search-and-find.lua`
  -- there really isn't much there.
  - Currently `\*`, `\<C-c\>` in normal mode will resp. highlight
    and select all occurrences of the currently hovered word and clear all search highlights
    (ie execute `:nohlsearch`)
  - Ideally going to bind e.g. `<C-f>` and similar to commands that request input for a search
    term and its replacement. I don't use the natively bound functionality much (scrolling),
    so it is of no loss to me, but maybe it is to you.
- Simple one: ensure consistency among glyphs.
  - e.g. the glyph set is not 100% consistent among all the plugins. This is really just a chore.

## plugins

- `nvim-cmp` is used as the completion engine. [docs](https://github.com/hrsh7th/nvim-cmp)
- `vim-wakatime` has no impact on functionality outside of more granular time-tracking
  than e.g. RescueTime (both of which I use). [docs](https://github.com/wakatime/vim-wakatime)
- `nvim-web-devicons` provide icons and glyphs. [docs](https://github.com/kyazdani42/nvim-web-devicons)
- `impatient` helps speed up the startup times. [docs](https://github.com/lewis6991/impatient.nvim)
- `nvim-colorizer` is likely to be removed, but adds some nice coloring features. [docs](https://github.com/norcalli/nvim-colorizer.lua)
- Currently using a nord theme across the board. `shaunsingh/nord.nvim` defines the colorscheme + a few
  options e.g. italics and so on. This is not fully hot-swappable with other colorschemes (e.g. `morhetz/gruvbox`
  or `sainnhe/everforest`, each of which I have used previously) since there is a configuration file for `shaunsingh/nord.nvim`
- `nvim-tree` provides a nice file explorer. [docs](https://github.com/kyazdani42/nvim-tree.lua)
- `gitsigns` provides the lovely colorings on the numbers and sidebar markings. [docs](https://github.com/lewis6991/gitsigns.nvim)
- `nvim-lsp-installer` simplifies the LSP installation and configuration process a bit simpler/ machine-agnostic, in particular.
  [docs](https://github.com/williamboman/nvim-lsp-installer)
- `saadparwaiz1/cmp_luasnip` adds Luasnips as a CMP source so that all can be unified under one umbrella. [docs](https://github.com/saadparwaiz1/)
- `nvim-cmp` and related build up a connection to several completion engine sources and language servers. The docs only for the
  primary project are included here: [docs](https://github.com/hrsh7th/nvim-cmp)
- `LuaSnip` is the snippets engine, described briefly above. It's used only as a source for `nvim-cmp`. [docs](https://github.com/L3MON4D3/LuaSnip)
- `nvim-treesitter` is also popular. Parses over buffers and determines syntax groupings, etc. for coloring and so on. This can be incorporated
  with several of the above plugins but is not currently.
  [docs](https://github.com/nvim-treesitter/nvim-treesitter)
- `nvim-toggleterm.lua` is used, similar to `nvim-tree`, to open a terminal buffer more smoothly than typing out the full command.
  This is currently mapped to `\<F1\>`. [docs](https://github.com/akinsha/nvim-toggleterm.lua)
- `nvim-comment` smooths out mass commenting e.g. for several lines at once (best done with a visual mode selection). Note that there are also a few
  comment generating snippets (see `snippets` directory from root). [docs](https://github.com/terrortaylor/nvim-comment)
- `indent-blankline.nvim` provides greater readability by marking indentation levels and highlighting the current selection. [docs](https://github.com/lukas-reineke/indent-blankline.nvim)
- `lualine` provides a customizable bottom-line that moves around. Makes the setup a bit more minimal, etc. [docs](https://github.com/nvim-lualine/lualine.nvim)
- `alpha-nvim` provides a more interesting home screen in the event that neovim is not launched with a file in mind. [docs](https://github.com/goolord/alpha-nvim)
- `neoscroll` is no longer used and will be removed. Provides smoother scrolling and screen centering, but it was too much of a jump for my workflow. [docs](https://github.com/karb94/neoscroll.nvim)
- `copilot.lua` and `copilot-cmp` have been mentioned already; they resp. implement the Github Copilot API and offer it as a source for `nvim-cmp` to pull from. [docs 1](https://github.com/zbirenbaum/copilot.lua) and
  [docs 2](https://github.com/copilot-cmp)
