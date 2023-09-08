return {
  "sindrets/winshift.nvim",
  cmd = { "WinShift" },
  keys = {
    { "<A-w>", "<cmd>WinShift<cr>" },
  },
  config = function(_, opts)
    require("winshift").setup(opts)
  end,
}
