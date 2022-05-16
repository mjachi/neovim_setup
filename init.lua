
--[[---------------------------------------------]]--
--         init.lua - Init file of LuaVim          --
--                  Author: Elai                   --
--                 License: GPLv3                  --
--[[---------------------------------------------]]--

local core_modules = {

---- Core Settings ----------------------------------
 "core/plugins",           -- Plugins + Packer Config
 "core/keymaps",           -- Custom Mappings
 "core/options",           -- General Settings

---- Plugin Configurations --------------------------
 "configs/impatient",      -- Improve Startup Time
 "configs/colorshemes",    -- All Colorshemes
 "configs/treesitter",     -- Syntax Highlighting
 "configs/completion",     -- Auto Completion
 "configs/alpha-nvim",     -- Wellcome Screen
 "configs/nvim-tree",      -- File Explorer
 "configs/gitsigns",       -- Git integration
 "configs/commentary",     -- Easily Comment Lines
 "configs/statusline",     -- Status Line
 "configs/colorizer",      -- Colors Highlighter
 "configs/smooth-scrl",    -- Smooth Scrolling
 "configs/toggleterm",     -- Floating Terminal

---- Other Utilities --------------------------------
 "utils/vstuff",           -- Other Stuff

}
-- Using pcall we can handle better any loading issues
for _, module in ipairs(core_modules) do
    local ok, err = pcall(require, module)
    if not ok then
      return
    end
end
