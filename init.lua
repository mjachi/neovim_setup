
local core_modules = {

---- Core Settings --------------------------------
 "core/plugins",           -- Plugins + Packer Conf
 "core/keymaps",           -- Custom Mappings
 "core/options",           -- General Settings

---- Plugin Configurations ------------------------
--"configs/..."

---- Utilities ------------------------------------
 "utils/vstuff",           -- Other Stuff

}

for _, module in ipairs(core_modules) do
    local ok, err = pcall(require, module)
    if not ok then
      return
    end
end
