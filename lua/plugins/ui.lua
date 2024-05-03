return {
  -- {
  --   "rcarriga/nvim-notify",
  --   lazy = false,
  --   init = function()
  --     vim.notify = require "notify"
  --   end,
  -- },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = false,
    config = function()
      require("catppuccin").setup { flavour = "mocha" }
      vim.cmd.colorscheme "catppuccin"

      local hl = vim.api.nvim_set_hl
      local c = require("catppuccin.palettes").get_palette()

      hl(0, "TelescopeMatching", { fg = c.flamingo })
      hl(0, "TelescopeSelection", { fg = c.text, bg = c.surface0, bold = true })
      hl(0, "TelescopePromptPrefix", { bg = c.surface0 })
      hl(0, "TelescopePromptNormal", { bg = c.surface0 })
      hl(0, "TelescopeResultsNormal", { bg = c.mantle })
      hl(0, "TelescopePreviewNormal", { bg = c.mantle })
      hl(0, "TelescopePromptBorder", { bg = c.surface0, fg = c.surface0 })
      hl(0, "TelescopeResultsBorder", { bg = c.mantle, fg = c.mantle })
      hl(0, "TelescopePreviewBorder", { bg = c.mantle, fg = c.mantle })
      hl(0, "TelescopePromptTitle", { bg = c.pink, fg = c.mantle })
      hl(0, "TelescopeResultsTitle", { fg = c.mantle })
      hl(0, "TelescopePreviewTitle", { bg = c.green, fg = c.mantle })
    end,
  },
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
