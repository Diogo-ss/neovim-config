return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = false,
    config = function()
      require("catppuccin").setup { flavour = "mocha" }
      vim.cmd.colorscheme "catppuccin"
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  {
    "kndndrj/nvim-dbee",
    lazy = true,
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    build = function()
      require("dbee").install()
    end,
    config = function()
      require("dbee").setup()
    end,
  },
  {
    "Diogo-ss/42-header.nvim",
    cmd = { "Stdheader" },
    keys = { "<F1>" },
    opts = {
      default_map = true, -- Default mapping <F1> in normal mode.
      auto_update = true, -- Update header when saving.
      git = {
        enabled = true,
      },
    },
    config = function(_, opts)
      require("42header").setup(opts)
    end,
  },
  {
    "terrortylor/nvim-comment",
    dependencies = {
      {
        "JoosepAlviste/nvim-ts-context-commentstring",
        config = function()
          require("ts_context_commentstring").setup {
            enable_autocmd = false,
          }
        end,
      },
    },
    config = function(_, opts)
      opts.hook = function()
        require("ts_context_commentstring").update_commentstring()
      end

      require("nvim_comment").setup(opts)
    end,
  },
  {
    "folke/neodev.nvim",
    lazy = false,
    opts = { library = { plugins = { "neotest" }, types = true } },
    config = function(_, opts)
      require("neodev").setup(opts)
    end,
  },
  {
    "rmagatti/goto-preview",
    lazy = false,
    keys = {
      { "gpd", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>" },
      { "gpt", "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>" },
      { "gpi", "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>" },
      { "gpD", "<cmd>lua require('goto-preview').goto_preview_declaration()<CR>" },
      { "gP", "<cmd>lua require('goto-preview').close_all_win()<CR>" },
      { "gpr", "<cmd>lua require('goto-preview').goto_preview_references()<CR>" },
    },
    config = function()
      require("goto-preview").setup {
        border = { "↖", "─", "┐", "│", "┘", "─", "└", "│" },
        focus_on_open = true,
        preview_window_title = { enable = true, position = "right" },
      }
    end,
  },
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
    "Diogo-ss/licenser.nvim",
    cmd = { "Licenser" },
    opts = {
      name = "Diogo Silva",
    },
    config = function(_, opts)
      require("licenser").setup(opts)
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
      require "fs.utils.install"()
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
    enabled = false,
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
