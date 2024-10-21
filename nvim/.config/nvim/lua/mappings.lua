require "nvchad.mappings"

local map = vim.keymap.set

map("n", "<leader>lf", function ()
  vim.lsp.buf.format({})
end)

map("n", "<leader>e", ":Explore<CR>")
