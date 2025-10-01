-- All vim options and basic settings

local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Mouse and clipboard
opt.mouse = "a"
opt.clipboard = "unnamedplus"

-- UI settings
opt.showmode = false
opt.signcolumn = "yes"
opt.cursorline = true
opt.scrolloff = 10
opt.splitright = true
opt.splitbelow = true

-- Search settings
opt.hlsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.inccommand = "split"

-- Indentation and formatting
opt.breakindent = true
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

-- File handling
opt.undofile = true
opt.updatetime = 250
opt.timeoutlen = 300

-- Visual aids
opt.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
