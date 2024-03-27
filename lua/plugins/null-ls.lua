return {
  "jay-babu/mason-null-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    ensure_installed = { "stylua" },
    automatic_installation = false,
    automatic_setup = true,
    handlers = {},
  },
  dependencies = {
    "williamboman/mason.nvim",
    "nvimtools/none-ls.nvim",
  },
  config = function(_, opts)
    require("mason").setup()
    require("mason-null-ls").setup(opts)
    require("null-ls").setup {}
  end,
}
