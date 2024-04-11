return {
  {
    "folke/which-key.nvim",
    enabled = false,
  },
  {
    -- 'jk' or 'jj' to exit insert mode
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  {
    -- search and replace
    "cshuaimin/ssr.nvim",
    keys = {
      {
        "<leader>sr",
        function()
          require("ssr").open()
        end,
        mode = { "n", "x" },
      },
    },
    config = function(_, opts)
      require("ssr").setup(opts)
    end,
  },
  {
    -- fix scroll
    "Aasim-A/scrollEOF.nvim",
    event = "BufRead",
    config = function(_, opts)
      require("scrollEOF").setup(opts)
    end,
  },
  {
    -- use to refactor code
    "ThePrimeagen/refactoring.nvim",
    cmd = "Refactor",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("refactoring").setup()
    end,
  },
  {
    -- code symbols tree
    "simrat39/symbols-outline.nvim",
    cmd = { "SymbolsOutlineClose", "SymbolsOutlineOpen", "SymbolsOutline" },
    opts = {
      auto_preview = false,
      position = "right",
      relative_width = true,
      auto_close = true,
    },
    config = function(_, opts)
      require("symbols-outline").setup(opts)
    end,
  },
  {
    -- toggle values in code
    "nguyenvukhang/nvim-toggler",
    lazy = false,
    keys = {
      { "<leader>i", mode = { "n", "v" } },
    },
    config = function(_, opts)
      require("nvim-toggler").setup(opts)
    end,
  },
  {
    "wakatime/vim-wakatime",
    lazy = false,
  },
  {
    -- move win
    "sindrets/winshift.nvim",
    cmd = { "WinShift" },
    keys = {
      { "<A-w>", "<cmd>WinShift<cr>" },
    },
    config = function(_, opts)
      require("winshift").setup(opts)
    end,
  },
  {
    -- see the one line code
    "nacro90/numb.nvim",
    event = { "CmdlineEnter" },
    config = function(_, opts)
      require("numb").setup(opts)
    end,
  },
  {
    "Diogo-ss/five-server.nvim",
    cmd = {
      "FiveServer",
    },
    keys = {
      { "<leader>fs", "<cmd>FiveServer start<cr>" },
      { "<leader>fS", "<cmd>FiveServer stop<cr>" },
    },
    build = function()
      require "fs.utils.install" ()
    end,
    opts = {
      notify = true,
    },
    config = function(_, opts)
      require("fs").setup(opts)
    end,
  },
  {
    "Pocco81/auto-save.nvim",
    cmd = { "ASToggle" },
    enabled = false,
    -- ft = { "html", "css", "javascript" },
    config = function(_, opts)
      require("auto-save").setup(opts)
    end,
  },
  {
    "DNLHC/glance.nvim",
    cmd = { "Glance" },
    keys = {
      { "gD", "<CMD>Glance definitions<CR>" },
      { "gR", "<CMD>Glance references<CR>" },
      { "gY", "<CMD>Glance type_definitions<CR>" },
      { "gM", "<CMD>Glance implementations<CR>" },
    },
    config = function(_, opts)
      require("glance").setup(opts)
    end,
  },
  {
    "fedepujol/move.nvim",
    keys = {
      { mode = { "v" }, "<A-j>", ":MoveBlock(1)<CR>" },
      { mode = { "v" }, "<A-k>", ":MoveBlock(-1)<CR>" },
      { mode = { "v" }, "<A-h>", ":MoveHBlock(-1)<CR>" },
      { mode = { "v" }, "<A-l>", ":MoveHBlock(1)<CR>" },
    },
    config = function()
      require("move").setup()
    end,
  },
}
