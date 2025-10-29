-- ~/.config/nvim/init.lua (or AppData/Local/nvim/init.lua on Windows)
-- Main entry point - loads all modules

-- Set leader key early
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.api.nvim_create_autocmd("BufNewFile", {
	pattern = "*.lua",
	callback = function()
		vim.opt.fileformat = "unix"
	end,
	desc = "Set new .lua files to use LF line endings",
})

-- Load core configuration modules
require("config.options")
require("config.keymaps")
require("config.autocmds")

-- Bootstrap and setup lazy.nvim
require("config.lazy")

print("Neovim configuration loaded! 🚀")
