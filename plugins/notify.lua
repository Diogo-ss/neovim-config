return {
  "rcarriga/nvim-notify",
  lazy = false,
  init = function()
    vim.notify = require "notify"
  end,
}
