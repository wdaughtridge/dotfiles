local wezterm = require("wezterm")
local config = {}

config.color_scheme = 'Ayu Dark (Gogh)'
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.font = wezterm.font("0xProto Nerd Font")
config.font_size = 18

return config
