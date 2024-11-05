require('config.lazy')

local lspconfig = require('lspconfig')
lspconfig.gopls.setup {}
lspconfig.rust_analyzer.setup {}
lspconfig.lua_ls.setup {}
lspconfig.lua_ls.setup {
	on_init = function(client)
		if client.workspace_folders then
			local path = client.workspace_folders[1].name
			---@diagnostic disable-next-line: undefined-field
			if vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc') then
				return
			end
		end

		client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
			runtime = {
				version = 'LuaJIT'
			},
			workspace = {
				checkThirdParty = false,
				library = {
					vim.env.VIMRUNTIME
				}
			}
		})
	end,
	settings = {
		Lua = {}
	}
}
lspconfig.csharp_ls.setup {}
lspconfig.elixirls.setup {
	cmd = { '/opt/homebrew/bin/elixir-ls' },
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

vim.keymap.set('n', '<leader>e', ':Explore<CR>')
vim.keymap.set('n', '<leader>x', ':bdelete<CR>')
vim.keymap.set('n', '<Esc>', ':nohlsearch<CR>')

vim.cmd 'colorscheme habamax'
vim.cmd 'hi Normal guibg=NONE ctermbg=NONE'
vim.cmd 'set signcolumn=yes'

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
