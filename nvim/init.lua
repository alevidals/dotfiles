-- To user space as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable neovim file explorer (netrw) because I will use tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Define the route where lazy should be installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Check if is installed and if not install it
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
-- To recognise it without restart neovim
vim.opt.rtp:prepend(lazypath)

vim.o.shell = "/bin/zsh"

require("lazy").setup("plugins")
require("set")
require("remap")
