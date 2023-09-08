return {
  "nacro90/numb.nvim",
  event = { "CmdlineEnter" },
  config = function(_, opts)
    require("numb").setup(opts)
  end,
}
