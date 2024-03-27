local tokyo_config = require "config.tokyovim"

return {
  spec = {
    {
      {
        "TokyoVim/TokyoVim",
        lazy = false,
        branch = "dev",
        priority = 10000,
        config = function()
          require("tokyovim").laod()
        end,
      },
      { import = "tokyovim.plugins.base" },
      { import = "tokyovim.plugins.git" },
      { import = "tokyovim.plugins.lsp" },
      { import = "tokyovim.plugins.ui" },
      { import = "plugins" },
    },
  },
  defaults = { lazy = true },
  ui = {
    icons = {
      lazy = "鈴 ",
    },
  },
  lockfile = tokyo_config.dirs.user .. "/data/lazy/lazy-lock.json",
  performance = {
    rtp = {
      disabled_plugins = {
        "getscript",
        "getscriptPlugin",
        "gzip",
        "ftplugin",
        "logipat",
        "netrw",
        "netrwPlugin",
        "rrhelper",
        "netrwSettings",
        "2html_plugin",
        "netrwFileHandlers",
        "tohtml",
        "matchit",
        "tar",
        "tutor",
        "syntax",
        "tarPlugin",
        "spellfile_plugin",
        "vimball",
        "vimballPlugin",
        "zip",
        "zipPlugin",
        "rplugin",
        "synmenu",
        "optwin",
        "compiler",
        "bugreport",
      },
    },
  },
}
