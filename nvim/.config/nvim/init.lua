require('config.lazy')
require('config.lsp')

-- -- -- -- --
-- Keymaps  --
-- -- -- -- --
-- Netrw size
vim.g.netrw_winsize = 25
-- Theme
vim.cmd.colorscheme('kanagawa')
-- Sign column
vim.opt.signcolumn = 'yes'
-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true
-- Find files
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', builtin.git_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>a', builtin.find_files, { desc = 'Telescope find files' })
-- Search
vim.keymap.set('n', '<leader>/', builtin.live_grep, { desc = 'Telescope live grep' })
-- Show buffers
vim.keymap.set('n', '<leader>b', builtin.buffers, { desc = 'Telescope buffers' })
-- File explorer
vim.keymap.set('n', '<leader>e', vim.cmd.Explore)
-- Delete buffer
vim.keymap.set('n', '<leader>q', vim.cmd.bdelete)
-- LSP
vim.keymap.set('n', '<leader>k', vim.lsp.buf.hover)
vim.keymap.set('n', '<leader>l', vim.lsp.buf.format)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)
-- Clean highlight
vim.keymap.set('n', '<Esc>', vim.cmd.nohlsearch)
-- Go to end, beginning of line
vim.keymap.set('n', 'gl', '$')
vim.keymap.set('n', 'gh', '0')

-- Mason
require('mason').setup {}

-- Treesitter
require 'nvim-treesitter.configs'.setup {
	ensure_installed = { 'c', 'lua', 'vim', 'vimdoc', 'query', 'markdown', 'markdown_inline', 'go', 'rust', 'c_sharp' },
	sync_install = false,
	ignore_install = { 'javascript' },
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
}
