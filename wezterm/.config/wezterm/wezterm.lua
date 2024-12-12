local wezterm = require 'wezterm'
local config = {}

config.color_scheme = 'Atom'
config.font = wezterm.font 'JetBrains Mono'
config.font_size = 16
config.use_fancy_tab_bar = false
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

return config
