-- Enable and set listchars (to enable visualisation of invisible characters)
vim.opt.list = true
vim.opt.listchars:append({ eol = "↵" })
vim.opt.listchars:append({ nbsp = "·" })
vim.opt.listchars:append({ trail = "·" })

-- Fat cursor for edit mode
vim.opt.guicursor = ""

-- Highlight current line
vim.opt.cursorline = true

-- Enable relative numbers and nu
vim.opt.nu = true
vim.opt.relativenumber = true

-- Indentation
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
-- Use spaces instead of tabs
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Wrap lines to screen width
vim.opt.wrap = true

-- Use a file for undo history
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Enable incremental search highlights
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Enable true colors
vim.opt.termguicolors = true

-- Better scrolling
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50
vim.opt.colorcolumn = "80"

-- Disable GitBlame by default
vim.g.gitblame_enabled = 0
