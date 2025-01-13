local wezterm = require 'wezterm'
local config = {}

config.color_scheme = 'Arthur'
config.font = wezterm.font 'JetBrains Mono SemiBold'
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
