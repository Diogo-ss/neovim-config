return {
  "Aasim-A/scrollEOF.nvim",
  event = "BufRead",
  config = function(_, opts)
    require("scrollEOF").setup(opts)
  end,
}
