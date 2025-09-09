return {
  "olexsmir/gopher.nvim",
  lazy = false,
  config = function(_, opts)
    require("gopher").setup(opts)
  end,
}
