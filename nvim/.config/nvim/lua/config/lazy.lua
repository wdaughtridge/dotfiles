local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
---@diagnostic disable-next-line: undefined-field
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system({ 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
      { out, 'WarningMsg' },
      { '\nPress any key to exit...' },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

require('lazy').setup({
  spec = {
    { import = 'plugins' },
  },
  checker = { enabled = true }
})

require('telescope').setup{ defaults = { file_ignore_patterns = {"deps"} } }

-- Lua LSP
local lspconfig = require('lspconfig')
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
