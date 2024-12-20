local lspconfig = require('lspconfig')
-- Go
lspconfig.gopls.setup {}
-- Rust
lspconfig.rust_analyzer.setup {}
-- Deno
lspconfig.denols.setup {}
-- C#
lspconfig.omnisharp.setup {
	cmd = { 'omnisharp' },
}
-- Elixir
lspconfig.elixirls.setup {
	cmd = { 'elixir-ls' },
}
