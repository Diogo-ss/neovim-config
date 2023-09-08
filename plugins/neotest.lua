return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "antoinemadec/FixCursorHold.nvim",
    -- adapters
    "nvim-neotest/neotest-python",
    "nvim-neotest/neotest-vim-test",
    "nvim-neotest/neotest-plenary",
  },
  cmd = {
    "Neotest",
    "NeotestRunDap",
    "NeotestLastDap",
  },
  config = function()
    require("neotest").setup {
      adapters = {
        require "neotest-python",
        require "neotest-vim-test",
        require "neotest-plenary",
      },
    }

    local command = vim.api.nvim_create_user_command

    command("NeotestLastDap", function()
      require("neotest").run.run_last { strategy = "dap" }
    end, { nargs = "*" })

    command("NeotestRunDap", function()
      require("neotest").run.run { strategy = "dap" }
    end, { nargs = "*" })
  end,
}
