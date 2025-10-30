return {
	"toppair/peek.nvim",
	build = "deno task --quiet build:fast",
	keys = {
		{
			"<leader>mp",
			function()
				local peek = require("peek")
				if peek.is_open() then
					peek.close()
				else
					peek.open()
				end
			end,
			desc = "Toggle Markdown Preview",
		},
	},
	opts = {
		auto_load = true,
		close_on_bdelete = true,
		syntax = true,
		theme = "dark",
		update_on_change = true,
		app = "webview",
		filetype = { "markdown" },
		throttle_at = 200000,
		throttle_time = "auto",
	},
}
