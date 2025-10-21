return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			preset = "modern",
			delay = 300,
			icons = {
				breadcrumb = "»",
				separator = "➜",
				group = "+",
			},
			spec = {
				{ "<leader>f", group = "Find (Telescope)" }, -- All <leader>f* commands
				{ "<leader>b", group = "Buffer" }, -- Buffer management
				{ "<leader>c", group = "Code" }, -- LSP/coding actions
				{ "<leader>d", group = "Database" }, -- Database UI
				{ "<leader>h", group = "Git Hunk" }, -- Git operations
				{ "<leader>t", group = "Toggle" }, -- Toggle features on/off
				{ "<leader>x", group = "Trouble" }, -- Diagnostics/errors
				{ "[", group = "Previous" }, -- Navigate backwards
				{ "]", group = "Next" }, -- Navigate forwards
				{ "g", group = "Goto" }, -- Navigation commands
			},
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},
}
