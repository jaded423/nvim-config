return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
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

		-- Get default capabilities from cmp_nvim_lsp
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

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
