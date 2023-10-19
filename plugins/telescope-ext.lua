return {
  "nvim-telescope/telescope.nvim",
  cmd = { "Telescope" },
  event = { "CmdlineEnter", "BufRead" },
  keys = {
    { "<F4>", "<cmd>lua vim.lsp.buf.range_code_action()<cr>", mode = "x" },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    -- extensions
    "lpoto/telescope-docker.nvim",
    "debugloop/telescope-undo.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
  },
  config = function(_, opts)
    local telescope = require "telescope"
    local load = telescope.load_extension

    opts = vim.tbl_deep_extend("force", opts, {
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown {},
        },
      },
    })

    telescope.setup(opts)
    load "docker"
    load "undo"
    load "ui-select"
  end,
}
