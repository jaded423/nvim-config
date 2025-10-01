-- ~/.config/nvim/init.lua (or AppData/Local/nvim/init.lua on Windows)
-- Main entry point - loads all modules

-- Set leader key early
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Load core configuration modules
require("config.options")
require("config.keymaps")
require("config.autocmds")

-- Bootstrap and setup lazy.nvim
require("config.lazy")

print("Neovim configuration loaded! 🚀")
