return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	lazy = false,
	priority = 50,
	config = function()
		require("mason").setup({
			ui = {
				border = "rounded",
			},
		})

		require("mason-lspconfig").setup({
			ensure_installed = {
				"ts_ls",
				"eslint",
				"jsonls",
				"html",
				"cssls",
				"pyright",
			},
		})

		-- Get capabilities from blink.cmp
		local capabilities = require("blink.cmp").get_lsp_capabilities()

		-- Use the new vim.lsp.config API instead of lspconfig
		local servers = {
			ts_ls = {},
			eslint = {},
			jsonls = {},
			html = {},
			cssls = {},
			pyright = {},
		}

		for server_name, config in pairs(servers) do
			-- Merge capabilities into config
			config.capabilities = capabilities

			-- Use vim.lsp.config instead of require('lspconfig')
			vim.lsp.config(server_name, config)
		end
	end,
}
