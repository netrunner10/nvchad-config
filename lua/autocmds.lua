require "nvchad.autocmds"

local autocmd = vim.api.nvim_create_autocmd

autocmd("BufEnter", {
  pattern = { "*.html", "*.css", "*.yaml", "*.yml", "*.json", "*lua", "*.js" },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.shiftwidth = 2
  end,
})

vim.api.nvim_create_autocmd("BufDelete", {
  callback = function()
    local bufs = vim.t.bufs
    if #bufs == 1 and vim.api.nvim_buf_get_name(bufs[1]) == "" then
      vim.cmd "Nvdash"
    end
  end,
})
