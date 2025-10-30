return {
	"ThePrimeagen/refactoring.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	keys = {
		{
			"<leader>re",
			function()
				require("refactoring").refactor("Extract Function")
			end,
			mode = "x",
			desc = "Extract Function",
		},
		{
			"<leader>rf",
			function()
				require("refactoring").refactor("Extract Function To File")
			end,
			mode = "x",
			desc = "Extract Function to File",
		},
		{
			"<leader>rv",
			function()
				require("refactoring").refactor("Extract Variable")
			end,
			mode = "x",
			desc = "Extract Variable",
		},
		{
			"<leader>ri",
			function()
				require("refactoring").refactor("Inline Variable")
			end,
			mode = { "n", "x" },
			desc = "Inline Variable",
		},
		{
			"<leader>rI",
			function()
				require("refactoring").refactor("Inline Function")
			end,
			mode = "n",
			desc = "Inline Function",
		},
		{
			"<leader>rb",
			function()
				require("refactoring").refactor("Extract Block")
			end,
			mode = "n",
			desc = "Extract Block",
		},
		{
			"<leader>rbf",
			function()
				require("refactoring").refactor("Extract Block To File")
			end,
			mode = "n",
			desc = "Extract Block to File",
		},
		{
			"<leader>rr",
			function()
				require("telescope").extensions.refactoring.refactors()
			end,
			mode = { "n", "x" },
			desc = "Refactor (Telescope)",
		},
	},
	opts = {
		prompt_func_return_type = {
			go = false,
			java = false,
			cpp = false,
			c = false,
			h = false,
			hpp = false,
			cxx = false,
		},
		prompt_func_param_type = {
			go = false,
			java = false,
			cpp = false,
			c = false,
			h = false,
			hpp = false,
			cxx = false,
		},
		printf_statements = {},
		print_var_statements = {},
		show_success_message = true,
	},
	config = function(_, opts)
		require("refactoring").setup(opts)
		-- Load refactoring Telescope extension
		require("telescope").load_extension("refactoring")
	end,
}
