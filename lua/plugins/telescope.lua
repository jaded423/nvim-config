return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find files" },
		{ "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Live grep" },
		{ "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Find buffers" },
		{ "<leader>fo", "<cmd>Telescope oldfiles<CR>", desc = "Recent files" },
	},
	config = function()
		-- Simple find command with hidden files enabled
		local find_command = {
			"rg",
			"--files",
			"--follow",
			"--hidden", -- Include hidden files like .config
		}

		-- Convert patterns to ripgrep args for live_grep (keeping this working as-is)
		local function get_ripgrep_args()
			return {
				"--follow",
				-- Same glob patterns as before - this is working well
				"--glob",
				"!.*/**",
				"--glob",
				"!.*",
				"--glob",
				".config/**",
				"--glob",
				"!node_modules/**",
				"--glob",
				"!Pictures/**",
				"--glob",
				"!Photos/**",
				"--glob",
				"!Movies/**",
				"--glob",
				"!Music/**",
				"--glob",
				"!Videos/**",
				"--glob",
				"!Downloads/**",
				"--glob",
				"!Library/**",
				-- Media files
				"--glob",
				"!*.jpg",
				"--glob",
				"!*.jpeg",
				"--glob",
				"!*.png",
				"--glob",
				"!*.gif",
				"--glob",
				"!*.bmp",
				"--glob",
				"!*.tiff",
				"--glob",
				"!*.webp",
				"--glob",
				"!*.svg",
				"--glob",
				"!*.ico",
				"--glob",
				"!*.mp4",
				"--glob",
				"!*.mov",
				"--glob",
				"!*.avi",
				"--glob",
				"!*.mkv",
				"--glob",
				"!*.webm",
				"--glob",
				"!*.mp3",
				"--glob",
				"!*.wav",
				"--glob",
				"!*.flac",
				"--glob",
				"!*.aac",
				"--glob",
				"!*.pdf",
				"--glob",
				"!*.doc",
				"--glob",
				"!*.docx",
				"--glob",
				"!*.zip",
				"--glob",
				"!*.tar",
				"--glob",
				"!*.gz",
			}
		end

		require("telescope").setup({
			defaults = {
				layout_config = {
					horizontal = {
						preview_cutoff = 100,
						preview_width = 0.6,
					},
				},
				-- Ensure icons are enabled (Nerd Font icons)
				prompt_prefix = " ",
				selection_caret = " ",
				entry_prefix = "  ",
			},
			pickers = {
				find_files = {
					-- Clean find command - no exclusions, just hidden files enabled
					find_command = find_command,
				},
				live_grep = {
					-- Keep the working live_grep configuration
					additional_args = get_ripgrep_args,
					cwd = vim.fn.expand("~"),
					search_dirs = {
						vim.fn.expand("~/.config"),
						vim.fn.expand("~/Desktop"),
						vim.fn.expand("~/Documents"),
						vim.fn.expand("~/projects"),
					},
				},
			},
		})
	end,
}
