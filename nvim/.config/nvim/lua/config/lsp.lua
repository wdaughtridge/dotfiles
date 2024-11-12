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
lspconfig.omnisharp.setup {
	cmd = { '/Users/wdaughtridge/.local/share/nvim/mason/bin/omnisharp' },
}
lspconfig.elixirls.setup {
	cmd = { '/Users/wdaughtridge/.local/share/nvim/mason/bin/elixir-ls' },
}
