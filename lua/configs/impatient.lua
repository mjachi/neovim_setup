
--[[---------------------------------------]]--
--      impatient - improve startup time     --
--               Author: Elai                --
--              License: GPLv3               --
--[[---------------------------------------]]--

-- Improve Startup Time
local status_ok, impatient = pcall(require, "impatient")
if not status_ok then
  return
end

-- View profiling data
impatient.enable_profile()
