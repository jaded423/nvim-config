return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      preset = "modern",
      delay = 300,
      icons = {
        breadcrumb = "»",
        separator = "➜",
        group = "+",
      },
      spec = {
        { "<leader>f", group = "Find (Telescope)" },
        { "<leader>b", group = "Buffer" },
        { "<leader>c", group = "Code" },
        { "<leader>d", group = "Database" },
        { "<leader>h", group = "Git Hunk" },
        { "<leader>t", group = "Toggle" },
        { "<leader>x", group = "Trouble" },
        { "[", group = "Previous" },
        { "]", group = "Next" },
        { "g", group = "Goto" },
      },
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },
}
