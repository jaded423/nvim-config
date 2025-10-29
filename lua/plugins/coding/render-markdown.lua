return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	ft = { "markdown" },
	opts = {
		-- Enable rendering in these modes
		render_modes = { "n", "c" },

		-- Optional: blink.cmp integration for markdown completions
		completions = {
			blink = { enabled = true },
		},
	},
}
