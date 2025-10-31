return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "VeryLazy",
	config = function()
		-- Custom component - shows parent/current directory
		local function cwd()
			local bufpath = vim.fn.expand("%:p:h")
			if bufpath == "" then
				return " " .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
			end
			local current = vim.fn.fnamemodify(bufpath, ":t")
			local parent = vim.fn.fnamemodify(bufpath, ":h:t")
			return " " .. parent .. "/" .. current
		end

		require("lualine").setup({
			options = {
				theme = "tokyonight",
				globalstatus = true,
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { cwd, "filename" },
				lualine_x = { "fileformat", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
		})
	end,
}
