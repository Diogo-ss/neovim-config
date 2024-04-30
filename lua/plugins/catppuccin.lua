return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = true,
  config = function()
    vim.cmd.colorscheme "catppuccin-mocha"
  end,
}
