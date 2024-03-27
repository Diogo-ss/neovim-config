return {
  dirs = {
    -- Path to user config.
    user = vim.fn.stdpath "config" .. "/lua",
    -- Path to Tokyovim data.
    data = vim.fn.stdpath "data" .. "/tokyovim",
  },
  ui = {
    -- Theme configuration. Supports function, string or 'false' to disable themes.
    theme = "catppuccin-mocha",
  },
  -- default commands or paths for programs
  bin = {
    git = "git",
    curl = "curl",
  },
}
