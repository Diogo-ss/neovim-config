return {
  "nvim-telescope/telescope.nvim",
  cmd = { "Telescope" },
  event = { "CmdlineEnter", "BufRead" },
  keys = {
    { "<F4>", vim.lsp.buf.range_code_action, mode = "x" },
    { "<leader>t", "<cmd>Telescope<cr>", mode = "n" },
    {
      ";r",
      function()
        require("telescope.builtin").live_grep()
      end,
    },
    {
      ";f",
      function()
        require("telescope.builtin").find_files {
          no_ignore = false,
          hidden = true,
        }
      end,
    },
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
