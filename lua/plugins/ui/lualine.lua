return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "VeryLazy",
	config = function()
		-- Custom component - shows parent/current directory
		local function cwd()
			local bufpath = vim.fn.expand("%:p")  -- Changed from %:p:h to %:p

			-- If no file/buffer open, use current working directory
			if bufpath == "" or bufpath == "." then
				local dir = vim.fn.getcwd()
				local current = vim.fn.fnamemodify(dir, ":t")
				local parent = vim.fn.fnamemodify(dir, ":h:t")
				return " " .. parent .. "/" .. current
			end

			-- Check if this is a directory (netrw buffer)
			if vim.fn.isdirectory(bufpath) == 1 then
				local current = vim.fn.fnamemodify(bufpath, ":t")
				local parent = vim.fn.fnamemodify(bufpath, ":h:t")
				return " " .. parent .. "/" .. current
			end

			-- Regular file - show parent/current directory of the file
			local dir = vim.fn.fnamemodify(bufpath, ":h")
			local current = vim.fn.fnamemodify(dir, ":t")
			local parent = vim.fn.fnamemodify(dir, ":h:t")
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
