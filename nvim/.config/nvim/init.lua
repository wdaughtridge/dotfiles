require('config.lazy')
require('config.lsp')

vim.g.netrw_winsize = 25

vim.cmd.colorscheme('habamax')
vim.cmd.hi('Normal guibg=NONE ctermbg=NONE')
vim.opt.signcolumn = 'yes'

vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

vim.keymap.set('n', '<leader>e', vim.cmd.Explore)
vim.keymap.set('n', '<leader>x', vim.cmd.bdelete)
vim.keymap.set('n', '<Esc>', vim.cmd.nohlsearch)

require('mason').setup {}

require 'nvim-treesitter.configs'.setup {
	ensure_installed = { 'c', 'lua', 'vim', 'vimdoc', 'query', 'markdown', 'markdown_inline', 'go', 'rust', 'elixir', 'c_sharp' },
	sync_install = false,
	ignore_install = { 'javascript' },
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
}
