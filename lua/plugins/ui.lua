return {
  -- {
  --   "rcarriga/nvim-notify",
  --   lazy = false,
  --   init = function()
  --     vim.notify = require "notify"
  --   end,
  -- },
  {
    "folke/noice.nvim",
    -- event = "VeryLazy",
    -- keys = { ":", "/", "?" },
    event = { "CmdlineEnter" },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    opts = {
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
    },
    config = function(_, opts)
      require("noice").setup(opts)
    end,
  },
}
