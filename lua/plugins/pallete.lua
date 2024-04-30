return {
  dir = "~/pallete.nvim/",
  lazy = false,
  config = function()
    require("pallete").setup()
    require("pallete").load()
  end,
}
