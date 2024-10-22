---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "dark_horizon",
}

M.ui = {
  statusline = {
    separator_style = "round",
    theme = "minimal"
  },
  cmp = {
    style = "atom"
  },
  tabufline = {
    lazyload = false,
  },
}

M.term = {
  float = {
    relative = "editor",
    row = 0.05,
    col = 0.1,
    width = 0.8,
    height = 0.8,
    border = "double",
  },
}

return M
