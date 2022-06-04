local core_modules = {
---- Core Settings ----------------------------------
 "core/plugins",
 "core/keymaps",
 "core/options",
---- Plugin Configurations --------------------------
 "configs/impatient",
 "configs/colorscheme",
 "configs/treesitter",
 "configs/completion",
 "configs/alpha-nvim",
 "configs/nvim-tree",
 "configs/gitsigns",
 "configs/commentary",
 "configs/statusline",
 "configs/colorizer",
 "configs/toggleterm",
 "configs/search-and-find",
---- Other Utilities --------------------------------
 "utils/vstuff",
}


for _, module in ipairs(core_modules) do
    local ok, err = pcall(require, module)
    if not ok then
      return err
    end
end
