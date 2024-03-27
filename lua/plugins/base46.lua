return {
  "Diogo-ss/base46",
  lazy = false,
  init = function()
    require("base46").setup { theme = "catppuccin" }
    require("base46").load_all_highlights()
  end,
}
