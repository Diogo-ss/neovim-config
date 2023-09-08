---@diagnostic disable: 113
local command = vim.api.nvim_create_user_command
local buffer = require "hydravim.core.utils.buffer"
local api = require "hydravim.core.utils.api"

command("CloseAll", function()
  buffer.delete_all(true)
end, { nargs = "*" })

command("ClangDebugCompile", function(args)
  local clang = args.fargs[1] or (vim.fn.executable "clang++" == 1 and "clang++" or "clang")

  if vim.fn.executable(clang) == 1 then
    local ftype = vim.bo.filetype

    if ftype == "c" or ftype == "cpp" then
      local debug_name = args.fargs[2] or vim.fn.split(vim.fn.expand "%:t", "." .. ftype)[1]
      local cmd = clang .. " --debug " .. vim.fn.expand "%:p" .. " -o " .. debug_name

      local output = vim.fn.system(cmd):gsub("\n", "")

      if output ~= "" then
        api.notify(output)
      else
        api.notify "Done!"
      end
    else
      api.notify "filetype not compatible"
    end
  else
    api.notify("`" .. clang .. "` is not avaliable", vim.log.levels.ERROR)
  end
end, { nargs = "*" })
