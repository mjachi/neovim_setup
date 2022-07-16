-- Author: Matthew Meeker

local core_modules = {
---- Core Settings ----------------------------------
 "core/plugins",
 "core/keymaps",
 "core/options",
---- Plugin Configurations --------------------------
 "configs/impatient",
 "configs/alpha-nvim",
 "configs/nvim-tree",
 "configs/treesitter",
 "configs/completion",
 "configs/aerial",

 -- visual
 "configs/colorscheme",
 "configs/colorizer",

 -- functionalities
 "configs/gitsigns",
 "configs/commentary",
 "configs/smooth-scrl",
 "configs/bufferline",
 "configs/toggleterm",
---- Other Utilities --------------------------------
 "utils/vstuff",
}

for _, module in ipairs(core_modules) do
    local ok, err = pcall(require, module)
    if not ok then
      return err
    end
end
