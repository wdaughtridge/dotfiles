-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "ayu_dark",
}

M.term = {
  float = {
    relative = "editor",
    row = 0,
    col = 0,
    width = 1,
    height = 1,
    border = "none",
  },
}

return M
