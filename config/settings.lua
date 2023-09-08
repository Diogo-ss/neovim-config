return {
  o = {
    cmdheight = 0,
  },
  opt = {
    tabstop = 2,
    clipboard = "",
    swapfile = false,
  },
  g = {
    hydravim = {
      lazy = {
        lockfile = vim.fn.stdpath "config" .. "/lua/user/data/lazy/lazy-lock.json",
      },
      dirs = {
        data = vim.fn.stdpath "config" .. "/lua/user/data",
      },
      ui = {
        theme = false,
        dash = true,
      },
      repository = {
        branch = "main",
        user_config = {
          branch = "main",
          remote = "Diogo-ss/hydravim-config",
        },
      },
    },
  },
}
