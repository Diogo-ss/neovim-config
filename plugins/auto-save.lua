return {
  "Pocco81/auto-save.nvim",
  cmd = { "ASToggle" },
  enabled = false,
  -- ft = { "html", "css", "javascript" },
  config = function(_, opts)
    require("auto-save").setup(opts)
  end,
}
