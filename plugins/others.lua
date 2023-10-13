return {
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
    -- open file in gh
    "almo7aya/openingh.nvim",
    cmd = { "OpenInGHRepo", "OpenInGHFile", "OpenInGHFileLines" },
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
    "aurum77/live-server.nvim",
    cmd = {
      "LiveServer",
      "LiveServerStart",
      "LiveServerStop",
    },
    build = function()
      require("live_server.util").install()
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
    config = function(_, opts)
      require("glance").setup(opts)
    end,
  },
}
