return {
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
    lazy = false,
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
    lazy = false,
  },

  {
    "stevearc/conform.nvim",
    enabled = false,
  },

  {
    "nvim-tree/nvim-tree.lua",
    enabled = false,
  },
}
