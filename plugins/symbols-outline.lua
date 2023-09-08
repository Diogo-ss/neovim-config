return {
  "simrat39/symbols-outline.nvim",
  cmd = { "SymbolsOutlineClose", "SymbolsOutlineOpen", "SymbolsOutline" },
  opts = {
    auto_preview = false,
    position = "right",
    relative_width = true,
    auto_close = true,
  },
  config = function(_, opts)
    require("symbols-outline").setup(opts)
  end,
}
