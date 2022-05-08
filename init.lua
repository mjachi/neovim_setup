
local core_modules = {

---- Core Settings --------------------------------
 "core/plugins",           -- Plugins + Packer Conf
 "core/keymaps",           -- Custom Mappings
 "core/options",           -- General Settings

---- Plugin Configurations ------------------------
 "configs/impatient",      -- Improve Startup Time
 "configs/colorshemes",    -- All Colorshemes
 "configs/treesitter",     -- Treesitter Config
 "configs/completion",     -- Auto Completion
 "configs/alpha-nvim",     -- Wellcome Screen
 "configs/nvim-tree",      -- File Explorer
 "configs/gitsigns",       -- Git Diff, Sign Column..
 "configs/comment-nvim",   -- Easily Comment Lines
 "configs/statusline",     -- Status Line
 "configs/colorizer",      -- Colors Highlighter
 "configs/smooth-scrl",    -- Smooth Scrolling

---- Other Utilities ------------------------------
 "utils/vstuff",           -- Other Stuff

}
-- Using pcall we can handle better any loading issues
for _, module in ipairs(core_modules) do
    local ok, err = pcall(require, module)
    if not ok then
      return
    end
end
