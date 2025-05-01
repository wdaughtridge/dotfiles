local wezterm = require 'wezterm'

local config = wezterm.config_builder()

local home = os.getenv("HOME")
local light = io.open(home .. "/.lightmode","r")
if light ~= nil then
  io.close(light)
  config.color_scheme = 'tokyonight-day'
else
  config.color_scheme = 'tokyonight-storm'
end

config.window_decorations = "RESIZE"
config.enable_tab_bar = false
config.font_size = 16.0

return config
