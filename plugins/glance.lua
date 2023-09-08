return {
  "DNLHC/glance.nvim",
  cmd = { "Glance" },
  config = function(_, opts)
    require("glance").setup(opts)
  end,
}
