return {
  "mfussenegger/nvim-dap",
  keys = {
    {
      "<F5>",
      function()
        require("dap").continue()
      end,
    },
    {
      "<F10>",
      function()
        require("dap").step_over()
      end,
    },
    {
      "<F11>",
      function()
        require("dap").step_into()
      end,
    },
    {
      "<F12>",
      function()
        require("dap").step_out()
      end,
    },
    {
      "<leader>b",
      function()
        require("dap").toggle_breakpoint()
      end,
    },
  },
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
      config = function()
        require("mason-nvim-dap").setup {
          handlers = {
            codelldb = function(_)
              local dap = require "dap"
              dap.configurations.c = {
                {
                  name = "LLDB: Launch",
                  type = "codelldb",
                  request = "launch",
                  program = function()
                    return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/main")
                  end,
                  cwd = "${workspaceFolder}",
                  stopOnEntry = false,
                  args = {},
                  console = "integratedTerminal",
                },
              }
              dap.adapters.codelldb = {
                name = "codelldb server",
                type = "server",
                port = "${port}",
                executable = {
                  command = vim.fn.stdpath "data" .. "/mason/bin/codelldb",
                  args = { "--port", "${port}" },
                },
              }
            end,
          },
        }
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
        controls = {
          icons = {
            disconnect = "",
            pause = "",
            play = "",
            run_last = "run_last",
            step_back = "step_back",
            step_into = "step_into",
            step_out = "step_out",
            step_over = "step_over",
            terminate = "terminate",
          },
        },
      },
      config = function(_, opts)
        local dap, dapui = require "dap", require "dapui"

        dap.listeners.before.attach.dapui_config = function()
          dapui.open()
        end

        dap.listeners.before.launch.dapui_config = function()
          pcall(require("nvim-tree.api").tree.close)
          dapui.open()
        end

        -- dap.listeners.before.event_terminated.dapui_config = function()
        --   dapui.close()
        -- end

        -- dap.listeners.before.event_exited.dapui_config = function()
        --   dapui.close()
        -- end

        dapui.setup(opts)
      end,
    },
  },
}
