return {
  "aurum77/live-server.nvim",
  cmd = {
    "LiveServer",
    "LiveServerStart",
    "LiveServerStop",
  },
  build = function()
    require("live_server.util").install()
  end,
}
