require('config.lazy')

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

local lspconfig = require('lspconfig')
lspconfig.gopls.setup{}
lspconfig.rust_analyzer.setup{}
lspconfig.lua_ls.setup{}
lspconfig.elixirls.setup{
  cmd = { '/opt/homebrew/bin/elixir-ls' };
}

require('mason').setup{}

require'nvim-treesitter.configs'.setup {
  ensure_installed = { 'c', 'lua', 'vim', 'vimdoc', 'query', 'markdown', 'markdown_inline', 'go', 'rust', 'elixir' },
  sync_install = false,
  ignore_install = { 'javascript' },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
