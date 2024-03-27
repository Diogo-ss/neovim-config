return {
  "kndndrj/nvim-dbee",
  lazy = true,
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  build = function()
    require("dbee").install()
  end,
  config = function()
    require("dbee").setup()
  end,
}
