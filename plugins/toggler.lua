return {
  "nguyenvukhang/nvim-toggler",
  lazy = false,
  keys = {
    { "<leader>i", mode = { "n", "v" } },
  },
  config = function(_, opts)
    require("nvim-toggler").setup(opts)
  end,
}
