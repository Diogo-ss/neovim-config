return {
  "folke/neodev.nvim",
  lazy = false,
  opts = { library = { plugins = { "neotest" }, types = true } },
  config = function(_, opts)
    require("neodev").setup(opts)
  end,
}
