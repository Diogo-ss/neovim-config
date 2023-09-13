return {
  "cshuaimin/ssr.nvim",
  keys = {
    {
      "<leader>sr", function() require("ssr").open() end, mode = { "n", "x" }
    }
  },
  config = function(_, opts)
    require("ssr").setup(opts)
  end,
}
