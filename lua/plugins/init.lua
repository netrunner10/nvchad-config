return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  {
    "stevearc/dressing.nvim",
    lazy = false,
    opts = {},
  },

  {
    "gbprod/yanky.nvim",
    lazy = false,
    recommended = true,
    desc = "Better Yank/Paste",
    opts = {
      highlight = { timer = 150 },
    },
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
    "nvim-neotest/neotest",
    lazy = false,
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      {
        "fredrikaverpil/neotest-golang",
        version = "*",
        dependencies = {
          "leoluz/nvim-dap-go",
        },
      },
    },
    config = function()
      local neotest_golang_opts = {}
      require("neotest").setup {
        adapters = {
          require "neotest-golang"(neotest_golang_opts),
        },
      }
    end,
  },

  {
    "mfussenegger/nvim-dap",
    lazy = false,
    config = function()
      local ok, dap_go = pcall(require, "dap-go")
      if not ok then
        return
      end
      dap_go.setup {
        dap_configurations = {
          {
            type = "go",
            name = "Attach remote",
            mode = "remote",
            request = "attach",
          },
        },
        delve = {
          path = "dlv",
          initialize_timeout_sec = 20,
          port = "${port}",
          args = {},
          build_flags = {},
          detached = vim.fn.has "win32" == 0,
          cwd = nil,
        },
        tests = {
          verbose = false,
        },
      }
    end,
    dependencies = {
      "leoluz/nvim-dap-go",
    },
  },

  {
    "rcarriga/nvim-dap-ui",
    lazy = false,
    config = function()
      require("dapui").setup()

      local dap, dapui = require "dap", require "dapui"

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open {}
      end

      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close {}
      end

      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close {}
      end
    end,
    dependencies = {
      "mfussenegger/nvim-dap",
    },
  },

  {
    "folke/neodev.nvim",
    lazy = false,
    config = function()
      require("neodev").setup {
        library = { plugins = { "nvim-dap-ui" }, types = true },
      }
    end,
  },

  { "tpope/vim-fugitive" },

  {
    "rbong/vim-flog",
    lazy = false,
    dependencies = {
      "tpope/vim-fugitive",
    },
  },

  {
    "sindrets/diffview.nvim",
    lazy = false,
  },

  {
    "ggandor/leap.nvim",
    lazy = false,
    config = function()
      require("leap").add_default_mappings(true)
    end,
  },

  {
    "kevinhwang91/nvim-bqf",
    lazy = false,
  },

  {
    "folke/trouble.nvim",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },

  {
    "folke/todo-comments.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("todo-comments").setup()
    end,
  },

  {
    "b0o/SchemaStore.nvim",
    lazy = true,
    version = false, -- last release is way too old
  },

  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters_by_ft = {
        dockerfile = { "hadolint" },
      },
    },
  },
}
