---@diagnostic disable: 113
local command = vim.api.nvim_create_user_command
local buffer = require "tokyovim.core.utils.buffer"
local api = require "tokyovim.core.utils.api"

command("CloseAll", function()
  buffer.delete_all(true)
end, { nargs = "*" })
