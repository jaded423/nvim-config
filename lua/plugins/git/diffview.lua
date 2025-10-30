return {
	"sindrets/diffview.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles", "DiffviewFileHistory" },
	keys = {
		{
			"<leader>gd",
			"<cmd>DiffviewOpen<cr>",
			desc = "Open Diffview",
		},
		{
			"<leader>gD",
			"<cmd>DiffviewClose<cr>",
			desc = "Close Diffview",
		},
		{
			"<leader>gh",
			"<cmd>DiffviewFileHistory %<cr>",
			desc = "File History",
		},
		{
			"<leader>gH",
			"<cmd>DiffviewFileHistory<cr>",
			desc = "Branch History",
		},
	},
	opts = {
		diff_binaries = false,
		enhanced_diff_hl = false,
		git_cmd = { "git" },
		hg_cmd = { "hg" },
		use_icons = true,
		show_help_hints = true,
		watch_index = true,
		icons = {
			folder_closed = "",
			folder_open = "",
		},
		signs = {
			fold_closed = "",
			fold_open = "",
			done = "✓",
		},
		view = {
			default = {
				layout = "diff2_horizontal",
				winbar_info = false,
			},
			merge_tool = {
				layout = "diff3_horizontal",
				disable_diagnostics = true,
				winbar_info = true,
			},
			file_history = {
				layout = "diff2_horizontal",
				winbar_info = false,
			},
		},
		file_panel = {
			listing_style = "tree",
			tree_options = {
				flatten_dirs = true,
				folder_statuses = "only_folded",
			},
			win_config = {
				position = "left",
				width = 35,
				win_opts = {},
			},
		},
		file_history_panel = {
			log_options = {
				git = {
					single_file = {
						diff_merges = "combined",
					},
					multi_file = {
						diff_merges = "first-parent",
					},
				},
			},
			win_config = {
				position = "bottom",
				height = 16,
				win_opts = {},
			},
		},
		commit_log_panel = {
			win_config = {
				win_opts = {},
			},
		},
		default_args = {
			DiffviewOpen = {},
			DiffviewFileHistory = {},
		},
		hooks = {},
		keymaps = {
			disable_defaults = false,
			view = {
				{
					"n",
					"<tab>",
					function()
						require("diffview.actions").select_next_entry()
					end,
					{ desc = "Next entry" },
				},
				{
					"n",
					"<s-tab>",
					function()
						require("diffview.actions").select_prev_entry()
					end,
					{ desc = "Previous entry" },
				},
				{
					"n",
					"gf",
					function()
						require("diffview.actions").goto_file()
					end,
					{ desc = "Go to file" },
				},
				{
					"n",
					"<C-w><C-f>",
					function()
						require("diffview.actions").goto_file_split()
					end,
					{ desc = "Go to file in split" },
				},
			},
			file_panel = {
				{
					"n",
					"j",
					function()
						require("diffview.actions").next_entry()
					end,
					{ desc = "Next entry" },
				},
				{
					"n",
					"k",
					function()
						require("diffview.actions").prev_entry()
					end,
					{ desc = "Previous entry" },
				},
				{
					"n",
					"<cr>",
					function()
						require("diffview.actions").select_entry()
					end,
					{ desc = "Select entry" },
				},
				{
					"n",
					"s",
					function()
						require("diffview.actions").toggle_stage_entry()
					end,
					{ desc = "Stage/unstage entry" },
				},
				{
					"n",
					"S",
					function()
						require("diffview.actions").stage_all()
					end,
					{ desc = "Stage all" },
				},
				{
					"n",
					"U",
					function()
						require("diffview.actions").unstage_all()
					end,
					{ desc = "Unstage all" },
				},
				{
					"n",
					"R",
					function()
						require("diffview.actions").refresh_files()
					end,
					{ desc = "Refresh" },
				},
			},
			file_history_panel = {
				{
					"n",
					"g!",
					function()
						require("diffview.actions").options()
					end,
					{ desc = "Options" },
				},
			},
		},
	},
}
