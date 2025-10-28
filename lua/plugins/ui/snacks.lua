return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	config = function()
		require("snacks").setup({
			input = { enabled = true },
			notifier = { enabled = true },
			quickfile = { enabled = true },
			words = { enabled = true },
			bigfile = { enabled = true },
			bufdelete = { enabled = true },
			indent = {
				enabled = true,
				animate = {
					enabled = vim.fn.has("nvim-0.10") == 1,
				},
			},
			scroll = {
				enabled = true,
				animate = {
					duration = { step = 15, total = 250 },
					easing = "linear",
				},
			},
			animate = { enabled = vim.fn.has("nvim-0.10") == 1 },
			statuscolumn = { enabled = true },
			toggle = { enabled = true },
			terminal = {
				enabled = true,
				win = {
					position = "float",
					height = 0.8,
					width = 0.8,
				},
			},

			lazygit = {
				enabled = true,
				configure = true,
			},
			gitbrowse = { enabled = true },

			scope = { enabled = true },
			scratch = { enabled = true },

			zen = {
				enabled = true,
				toggles = {
					dim = true,
					git_signs = false,
					diagnostics = false,
				},
			},
			dim = { enabled = true },

			dashboard = {
				enabled = true,
				sections = {
					{ section = "header" },
					{ section = "keys", gap = 1, padding = 1 },
					{ section = "startup" },
					{
						section = "terminal",
						cmd = "ascii-image-converter "
							.. vim.fn.stdpath("config")
							.. "/lua/plugins/snek.png -C -c -W 55",
						random = 10,
						pane = 2,
						indent = 4,
						height = 30,
					},
				},
				preset = {
					header = [[
     ██╗ █████╗ ██████╗ ███████╗██████╗
     ██║██╔══██╗██╔══██╗██╔════╝██╔══██╗
     ██║███████║██║  ██║█████╗  ██║  ██║
██   ██║██╔══██║██║  ██║██╔══╝  ██║  ██║
╚█████╔╝██║  ██║██████╔╝███████╗██████╔╝
 ╚════╝ ╚═╝  ╚═╝╚═════╝ ╚══════╝╚═════╝
    🐍 Strike fast. Code faster! 🐍
					]],
					keys = {
						{
							icon = " ",
							key = "f",
							desc = "Find File",
							action = function()
								vim.cmd("Telescope find_files")
							end,
						},
						{
							icon = " ",
							key = "n",
							desc = "New File",
							action = function()
								vim.cmd("ene | startinsert")
							end,
						},
						{
							icon = " ",
							key = "g",
							desc = "Find Text",
							action = function()
								vim.cmd("Telescope live_grep")
							end,
						},
						{
							icon = " ",
							key = "r",
							desc = "Recent Files",
							action = function()
								vim.cmd("Telescope oldfiles")
							end,
						},
						{
							icon = " ",
							key = "c",
							desc = "Config",
							action = function()
								vim.cmd("Telescope find_files cwd=" .. vim.fn.stdpath("config"))
							end,
						},
						{
							icon = " ",
							key = "d",
							desc = "Database UI",
							action = function()
								vim.cmd("DBUI")
							end,
						},
						{
							icon = " ",
							key = "L",
							desc = "Lazy Plugin Manager",
							action = function()
								vim.cmd("Lazy")
							end,
						},
						{
							icon = " ",
							key = "M",
							desc = "Mason LSP Manager",
							action = function()
								vim.cmd("Mason")
							end,
						},
						{
							icon = " ",
							key = "q",
							desc = "Quit",
							action = function()
								vim.cmd("qa")
							end,
						},
					},
				},
			},
		})
	end,
}
