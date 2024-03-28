return {
  "mfussenegger/nvim-dap",
  cmd = {
    "DapShowLog",
    "DapToggleBreakpoint",
    "DapToggleRepl",
    "DapStepInto",
    "DapStepOver",
    "DapStepOut",
    "DapTerminate",
    "DapContinue",
    "DapSetLogLevel",
    "DapRestartFrame",
    "DapLoadLaunchJSON",
  },
  dependencies = {
    {
      "nvim-neotest/nvim-nio",
    },
    {
      "rcarriga/cmp-dap",
      dependencies = { "nvim-cmp" },
      config = function()
        require("cmp").setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
          sources = {
            { name = "dap" },
          },
        })
      end,
    },
    {
      "jay-babu/mason-nvim-dap.nvim",
      dependencies = { "nvim-dap" },
      cmd = { "DapInstall", "DapUninstall" },
      opts = { handlers = {} },
      config = function(_, opts)
        require("mason-nvim-dap").setup(opts)
      end,
    },
    {
      "theHamsta/nvim-dap-virtual-text",
      cmd = {
        "DapVirtualTextEnable",
        "DapVirtualTextToggle",
        "DapVirtualTextDisable",
        "DapVirtualTextForceRefresh",
      },
      config = function(_, opts)
        require("nvim-dap-virtual-text").setup(opts)
      end,
    },
    {
      "rcarriga/nvim-dap-ui",
      opts = {
        floating = {
          border = "rounded",
        },
      },
      config = function(_, opts)
        local dap, dapui = require "dap", require "dapui"
        dap.listeners.after.event_initialized["dapui_config"] = function()
          dapui.open()
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
          dapui.close()
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
          dapui.close()
        end
        dapui.setup(opts)
      end,
    },
  },
}
