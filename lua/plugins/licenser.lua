return {
  "Diogo-ss/licenser.nvim",
  cmd = { "Licenser" },
  opts = {
    name = "Diogo Silva",
  },
  config = function(_, opts)
    require("licenser").setup(opts)
  end,
}
