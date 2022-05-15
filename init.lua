
local core_modules = {

---- Core Settings --------------------------------
  "core/plugins",
  "core/options",

---- Plugin Configurations ------------------------
  "configs/colorscheme",
  "configs/treesitter",
  "configs/cmp",

---- Utilities ------------------------------------

}

for _, module in ipairs(core_modules) do
    local ok, err = pcall(require, module)
    if not ok then
      return
    end
end
