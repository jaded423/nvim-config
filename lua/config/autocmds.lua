-- All autocommands and automation

-- Enable word wrapping and concealing for markdown files (Obsidian compatibility)
vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.linebreak = true
		vim.opt_local.list = false
		vim.opt_local.conceallevel = 2 -- Required for Obsidian syntax features
	end,
	desc = "Enable word wrapping and concealing for markdown files",
})

-- Highlight when yanking text
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	desc = "Highlight when yanking text",
})

-- Auto-organize Obsidian notes on save based on frontmatter type
vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "*.md",
	callback = function()
		-- Only run for files in the Obsidian vault
		local vault_path = "/Users/joshuabrown/Library/CloudStorage/GoogleDrive-joshua@elevatedtrading.com/My Drive/Elevated Vault"
		local current_file = vim.api.nvim_buf_get_name(0)
		if current_file:match(vim.pesc(vault_path)) then
			require("config.obsidian-helpers").auto_organize_note()
		end
	end,
	desc = "Auto-organize Obsidian notes by type on save",
})
