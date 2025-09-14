return {
  "mfussenegger/nvim-lint",
  optional = true,
  opts = {
    linters_by_ft = {
      dockerfile = { "hadolint" },
      python = { "flake8" },
    },
  },
}
