return {
	"mrjones2014/smart-splits.nvim",
	lazy = false,
	keys = {
		-- Resizing splits
		{
			"<C-Left>",
			function()
				require("smart-splits").resize_left()
			end,
			desc = "Resize split left",
		},
		{
			"<C-Down>",
			function()
				require("smart-splits").resize_down()
			end,
			desc = "Resize split down",
		},
		{
			"<C-Up>",
			function()
				require("smart-splits").resize_up()
			end,
			desc = "Resize split up",
		},
		{
			"<C-Right>",
			function()
				require("smart-splits").resize_right()
			end,
			desc = "Resize split right",
		},
		-- Moving between splits (overrides default window navigation if preferred)
		{
			"<A-h>",
			function()
				require("smart-splits").move_cursor_left()
			end,
			desc = "Move to left split",
		},
		{
			"<A-j>",
			function()
				require("smart-splits").move_cursor_down()
			end,
			desc = "Move to split below",
		},
		{
			"<A-k>",
			function()
				require("smart-splits").move_cursor_up()
			end,
			desc = "Move to split above",
		},
		{
			"<A-l>",
			function()
				require("smart-splits").move_cursor_right()
			end,
			desc = "Move to right split",
		},
		-- Swapping buffers between windows
		{
			"<leader><leader>h",
			function()
				require("smart-splits").swap_buf_left()
			end,
			desc = "Swap buffer left",
		},
		{
			"<leader><leader>j",
			function()
				require("smart-splits").swap_buf_down()
			end,
			desc = "Swap buffer down",
		},
		{
			"<leader><leader>k",
			function()
				require("smart-splits").swap_buf_up()
			end,
			desc = "Swap buffer up",
		},
		{
			"<leader><leader>l",
			function()
				require("smart-splits").swap_buf_right()
			end,
			desc = "Swap buffer right",
		},
	},
	opts = {
		ignored_filetypes = {
			"nofile",
			"quickfix",
			"prompt",
		},
		ignored_buftypes = { "NvimTree" },
		default_amount = 3,
		at_edge = "wrap",
		float_win_behavior = "previous",
		move_cursor_same_row = false,
		cursor_follows_swapped_bufs = false,
		resize_mode = {
			quit_key = "<ESC>",
			resize_keys = { "h", "j", "k", "l" },
			silent = false,
			hooks = {
				on_enter = nil,
				on_leave = nil,
			},
		},
		ignored_events = {
			"BufEnter",
			"WinEnter",
		},
		multiplexer_integration = nil,
		disable_multiplexer_nav_when_zoomed = true,
		kitty_password = nil,
		log_level = "info",
	},
}
