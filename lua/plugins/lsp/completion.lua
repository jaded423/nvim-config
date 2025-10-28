return {
	"saghen/blink.cmp",
	dependencies = {
		"rafamadriz/friendly-snippets",
	},
	-- use a release tag to download pre-built binaries
	version = "v0.*",

	event = "InsertEnter",

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		-- 'default' for mappings similar to built-in completion
		-- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
		-- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
		keymap = { preset = "default" },

		appearance = {
			-- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
			-- Adjusts spacing to ensure icons are aligned
			nerd_font_variant = "mono",
		},

		-- Default list of enabled providers defined so that you can extend it
		-- elsewhere in your config, without redefining it, via `opts_extend`
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},

		completion = {
			accept = {
				-- Experimental auto-brackets support
				auto_brackets = {
					enabled = true,
				},
			},

			menu = {
				draw = {
					treesitter = { "lsp" },
				},
			},

			documentation = {
				auto_show = true,
				auto_show_delay_ms = 200,
			},

			ghost_text = {
				enabled = false,
			},
		},

		-- Experimental signature help support
		signature = { enabled = true },
	},

	opts_extend = { "sources.default" },
}
