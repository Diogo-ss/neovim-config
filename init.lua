vim.opt.shortmess:append "I"

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
local repo = "https://github.com/folke/lazy.nvim.git"

if not vim.loop.fs_stat(lazypath) then
  vim.cmd "redraw"
  vim.notify " Installing TokyoVim..."
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local config = require "config.lazy"

require("lazy").setup(config)
