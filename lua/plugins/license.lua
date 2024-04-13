return {
  "Diogo-ss/licenser.nvim",
  cmd = { "Licenser" },
  opts = {
    name = "Diogo",
  },
  config = function(_, opts)
    require("licenser").setup(opts)
  end,
}
