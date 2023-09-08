local autocmd = vim.api.nvim_create_autocmd

-- https://www.reddit.com/r/neovim/comments/zc720y/comment/iyvcdf0/?utm_source=share&utm_medium=web2x&context=3
vim.on_key(function(char)
  if vim.fn.mode() == "n" then
    local new_hlsearch = vim.tbl_contains({ "<CR>", "n", "N", "*", "#", "?", "/" }, vim.fn.keytrans(char))
    if vim.opt.hlsearch:get() ~= new_hlsearch then
      vim.opt.hlsearch = new_hlsearch
    end
  end
end, vim.api.nvim_create_namespace "auto_hlsearch")

-- https://neovim.discourse.group/t/how-can-i-customize-clipboard-provider-using-lua/2564
autocmd({ "TextYankPost" }, {
  callback = function()
    local function should_add(event)
      local length = #event.regcontents - 1
      for _, line in ipairs(event.regcontents) do
        length = length + #line
        if length > 10000 then
          return false
        end
      end
      return true
    end

    local event = vim.v.event
    if should_add(event) then
      local joined = vim.fn.join(event.regcontents, "\n")
      local based = vim.fn.system("base64 | tr -d '\n'", joined)
      vim.fn.chansend(vim.v.stderr, vim.fn.printf("\x1b]52;;%s\x1b\\", based))
    end
  end,
})
