-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
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
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- Import all plugin categories
		{ import = "plugins" },
		{ import = "plugins.editor" },
		{ import = "plugins.lsp" },
		{ import = "plugins.ui" },
		{ import = "plugins.git" },
		{ import = "plugins.navigation" },
		{ import = "plugins.coding" },
	},
	change_detection = {
		notify = false,
	},
	checker = {
		enabled = true,
		notify = false,
	},
})
