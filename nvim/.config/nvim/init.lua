vim.lsp.set_log_level("debug")

vim.opt.mouse = ""

-- LSP

vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "gd", function()
    vim.lsp.buf.definition()
end)

vim.keymap.set("n", "K", function()
    vim.lsp.buf.hover()
end)

--       --
-- Swift --
--       --
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*.swift",
    callback = function()
        local root_dir = vim.fs.dirname(
            vim.fs.find({ '*.xcodeproj', '.git', 'ContentView.swift' }, { upward = true })[1]
        )
        local client = vim.lsp.start({
            name = 'xcrun',
            cmd = { 'sourcekit-lsp' },
            root_dir = root_dir,
        })
        vim.lsp.buf_attach_client(0, client)
    end
})

--    --
-- Go --
--    --
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*.go",
    callback = function()
        local root_dir = vim.fs.dirname(
            vim.fs.find({ 'main.go', 'go.mod', 'go.sum', '.git' }, { upward = true })[1]
        )
        local client = vim.lsp.start({
            name = 'gopls',
            cmd = { 'gopls', 'serve' },
            root_dir = root_dir,
        })
        vim.lsp.buf_attach_client(0, client)
    end
})

--           --
-- Terraform --
--           --
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*.tf",
    callback = function()
        local root_dir = vim.fs.dirname(
            vim.fs.find({ 'main.tf', '.git' }, { upward = true })[1]
        )
        local client = vim.lsp.start({
            name = 'terraform-ls',
            cmd = { 'terraform-ls', 'serve' },
            root_dir = root_dir,
        })
        vim.lsp.buf_attach_client(0, client)
    end
})
 
-- SET

vim.api.nvim_create_user_command('Q', 'q', {})
vim.api.nvim_create_user_command('W', 'w', {})
vim.api.nvim_create_user_command('NewTerminal', 'tabnew | terminal', {})

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

-- REMAP

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("i", "<C-l>", "<C-o>V>")
vim.keymap.set("i", "<C-h>", "<C-o>V<")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set("n", "<leader>tn", ":tabnew<CR>")
vim.keymap.set("n", "<leader>te", ":tabedit ")

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("i", "<C-s>", vim.lsp.buf.signature_help)

vim.keymap.set("t", "<C-\\><C-\\>", "<C-\\><C-n>")
vim.keymap.set("n", "<C-g>", "gt")
vim.keymap.set("n", "<C-f>", "gT")
vim.keymap.set("i", "<C-g>", "<Esc>gt")
vim.keymap.set("i", "<C-f>", "<Esc>gT")
vim.keymap.set("t", "<C-g>", "<C-\\><C-n>gt")
vim.keymap.set("t", "<C-f>", "<C-\\><C-n>gT")
vim.keymap.set("n", "<leader>nt", "<cmd>FloatermToggle<CR>")

-- VIM CMD

vim.cmd("let g:floaterm_width=0.9")
vim.cmd("let g:floaterm_height=0.9")
vim.cmd("set completeopt-=preview")
vim.cmd("set foldcolumn=0")
vim.cmd("filetype on")
vim.cmd("let g:netrw_banner=0")
vim.cmd("let g:netrw_list_hide='\\(^\\|\\s\\s\\)\\zs\\.\\S\\+'")
vim.cmd("colorscheme tokyonight-night")

-- END
