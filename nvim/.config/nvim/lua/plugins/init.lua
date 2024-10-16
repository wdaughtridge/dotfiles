return {
  {
    "stevearc/conform.nvim",
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
  		ensure_installed = {
  			"vim", "lua", "vimdoc",
        "html", "css", "elixir",
        "terraform", "hcl",
  		},
  	},
  },

  {
    "nvim-orgmode/orgmode",
    event = "VeryLazy",
    ft = { "org" },
    config = function()
      require("orgmode").setup({
        org_agenda_files = "~/org/**/*",
        org_default_notes_file = "~/org/refile.org",
        org_todo_keywords = {
          "BACKLOG(b)",
          "OPEN(o)",
          "TODO(t)",
          "READY(s)",
          "IN-PROGRESS(i)",
          "CODE-REVIEW(r)",
          "TESTING(e)",
          "|",
          "DONE(d)",
          "CLOSED(c)",
        },
      })
    end,
  },

  {
    "tpope/vim-fugitive",
    event = "VeryLazy",
    config = function()
      local Fugitive = vim.api.nvim_create_augroup("Fugitive", {})
      vim.api.nvim_create_autocmd("BufWinEnter", {
        group = Fugitive,
        pattern = "*",
        callback = function()
          if vim.bo.ft ~= "fugitive" then
            return
          end
          local bufnr = vim.api.nvim_get_current_buf()
          local opts = { buffer = bufnr, remap = false }
          vim.keymap.set("n", "<leader>F", function()
            vim.cmd.Git('pull')
          end, opts)
          vim.keymap.set("n", "<leader>P", function()
            vim.cmd.Git('push')
          end, opts)
        end,
      })
    end,
  },
}
