return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    lazy = false,
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "yamlls",
        "hadolint",
        "gopls",
        "goimports",
        "gofumpt",
        "gomodifytags",
        "impl",
        "delve",
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "yaml",
        "dockerfile",
        "go",
        "gomod",
        "gowork",
        "gosum",
      },
    },
  },

  {
    "nvim-tree/nvim-tree.lua",
  },

  {
    "nvim-telescope/telescope.nvim",
    lazy = false,
  },

  {
    "hrsh7th/nvim-cmp",
    lazy = false,
  },

  {
    "L3MON4D3/LuaSnip",
    lazy = false,
  },

  {
    "folke/which-key.nvim",
    lazy = false,
  },
}
