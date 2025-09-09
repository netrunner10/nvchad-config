return {
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
}
