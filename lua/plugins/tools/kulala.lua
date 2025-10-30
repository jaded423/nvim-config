return {
	"mistweaverco/kulala.nvim",
	ft = "http",
	keys = {
		{
			"<leader>kr",
			function()
				require("kulala").run()
			end,
			desc = "Run HTTP request",
		},
		{
			"<leader>ka",
			function()
				require("kulala").run_all()
			end,
			desc = "Run all HTTP requests",
		},
		{
			"<leader>kt",
			function()
				require("kulala").toggle_view()
			end,
			desc = "Toggle HTTP response view",
		},
		{
			"<leader>kc",
			function()
				require("kulala").copy()
			end,
			desc = "Copy HTTP request as cURL",
		},
		{
			"<leader>ki",
			function()
				require("kulala").inspect()
			end,
			desc = "Inspect HTTP request",
		},
		{
			"<leader>ks",
			function()
				require("kulala").scratchpad()
			end,
			desc = "Open HTTP scratchpad",
		},
		{
			"]k",
			function()
				require("kulala").jump_next()
			end,
			desc = "Jump to next request",
		},
		{
			"[k",
			function()
				require("kulala").jump_prev()
			end,
			desc = "Jump to previous request",
		},
	},
	opts = {
		default_view = "body",
		default_env = "dev",
		debug = false,
		contenttypes = {
			["application/json"] = {
				ft = "json",
				formatter = { "jq", "." },
				pathresolver = { "jq", "-r" },
			},
			["application/xml"] = {
				ft = "xml",
				formatter = { "xmllint", "--format", "-" },
				pathresolver = {},
			},
			["text/html"] = {
				ft = "html",
				formatter = { "xmllint", "--format", "--html", "-" },
				pathresolver = {},
			},
		},
		show_icons = "on_request",
		icons = {
			inlay = {
				loading = "⏳",
				done = "✅",
				error = "❌",
			},
			lualine = "🐼",
		},
		additional_curl_options = {},
		scratchpad_default_contents = {
			"@MY_TOKEN_NAME=my_token_value",
			"",
			"# @name scratchpad",
			"POST https://httpbin.org/post HTTP/1.1",
			"accept: application/json",
			"content-type: application/json",
			"",
			"{",
			'  "foo": "bar"',
			"}",
		},
		winbar = false,
		default_winbar_panes = { "body", "headers", "headers_body" },
	},
}
