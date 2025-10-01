return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find files" },
    { "<leader>fg", "<cmd>Telescope live_grep<CR>",  desc = "Live grep" },
    { "<leader>fb", "<cmd>Telescope buffers<CR>",    desc = "Find buffers" },
    { "<leader>fo", "<cmd>Telescope oldfiles<CR>",   desc = "Recent files" },
  },
  config = function()
    require("telescope").setup({
      defaults = {
        file_ignore_patterns = { "node_modules", ".git/" },
        layout_config = {
          horizontal = {
            preview_cutoff = 100,
            preview_width = 0.6,
          },
        },
        -- Ensure icons are enabled
        prompt_prefix = "🔍 ",
        selection_caret = "➤ ",
        entry_prefix = "  ",
      },
      pickers = {
        find_files = {
          -- Enable hidden files search
          hidden = true,
          -- Better file ignore patterns
          file_ignore_patterns = {
            "node_modules",
            ".git/",
            "%.cache/",
            "%.local/share/",
            "Library/",
            "%.DS_Store",
            "Pictures/",
            "Photos/",
            -- Image files
            "%.jpg",
            "%.jpeg",
            "%.png",
            "%.gif",
            "%.bmp",
            "%.tiff",
            "%.webp",
            "%.svg",
            "%.ico",
            -- Video files
            "%.mp4",
            "%.mov",
            "%.avi",
            "%.mkv",
            "%.webm",
            -- Audio files
            "%.mp3",
            "%.wav",
            "%.flac",
            "%.aac",
          },
          -- Use default find command but with hidden files
          -- Remove custom find_command to use telescope's default
        },
        live_grep = {
          -- Also search in hidden files for live grep
          additional_args = function()
            return { "--hidden", "--glob", "!.git/*" }
          end,
        },
      },
    })
  end,
}
