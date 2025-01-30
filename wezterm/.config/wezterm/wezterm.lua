local wezterm = require("wezterm")
local config = {}

local KanagawaDragon = wezterm.color.get_builtin_schemes()["Kanagawa (Gogh)"];
KanagawaDragon.background = "#181616"
config.color_schemes = {
  ["KanagawaDragon"] = KanagawaDragon,
}
config.color_scheme = "KanagawaDragon";

config.font = wezterm.font("0xProto Nerd Font")
config.font_size = 18
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

return config
