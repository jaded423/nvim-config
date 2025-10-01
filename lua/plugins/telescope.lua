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
    require("telescope").setup({
      defaults = {
        file_ignore_patterns = { "node_modules", ".git" },
        layout_config = {
          horizontal = {
            preview_cutoff = 100,
            preview_width = 0.6,
          },
        },
      },
    })
  end,
}
