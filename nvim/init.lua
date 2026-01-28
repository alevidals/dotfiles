-- Set leader key as space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable netrw I will use tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


vim.opt.termguicolors = true

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  print("AAA")
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

-- To recognise Lazy without restart neovim
vim.opt.rtp:prepend(lazypath)

-- vim.o.shell = "/bin/zsh"

require("lazy").setup("plugins")
require("set")
require("remap")
