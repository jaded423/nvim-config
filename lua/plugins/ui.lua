return {
  -- Better UI for cmdline and messages
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    opts = {
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = false,
      },
    },
  },

  -- Enhanced vim.ui.input with dashboard
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    config = function()
      require("snacks").setup({
        -- Already enabled features
        input = { enabled = true },
        notifier = { enabled = true },
        quickfile = { enabled = true },
        words = { enabled = true },

        -- Essential additions
        bigfile = { enabled = true },
        bufdelete = { enabled = true },
        indent = {
          enabled = true,
          animate = {
            enabled = vim.fn.has("nvim-0.10") == 1,
          },
        },
        scroll = {
          enabled = true,
          animate = {
            duration = { step = 15, total = 250 },
            easing = "linear",
          },
        },
        animate = { enabled = vim.fn.has("nvim-0.10") == 1 },
        statuscolumn = { enabled = true },
        toggle = { enabled = true },
        terminal = {
          enabled = true,
          win = {
            position = "float",
            height = 0.8,
            width = 0.8,
          },
        },

        -- Git features
        lazygit = {
          enabled = true,
          configure = true,
        },
        gitbrowse = { enabled = true },

        -- Code/navigation features
        scope = { enabled = true },
        scratch = { enabled = true },

        -- Focus features
        zen = {
          enabled = true,
          toggles = {
            dim = true,
            git_signs = false,
            diagnostics = false,
          },
        },
        dim = { enabled = true },

        dashboard = {
          enabled = true,
          sections = {
            { section = "header" },
            { section = "keys", gap = 1, padding = 1 },
            { section = "startup" },
            {
              section = "terminal",
              cmd = "ascii-image-converter " .. vim.fn.stdpath("config") .. "/lua/plugins/snek.png -C -c",
              random = 10,
              pane = 2,
              indent = 4,
              height = 30,
            },
          },
          preset = {
            header = [[
     ██╗ █████╗ ██████╗ ███████╗██████╗ 
     ██║██╔══██╗██╔══██╗██╔════╝██╔══██╗
     ██║███████║██║  ██║█████╗  ██║  ██║
██   ██║██╔══██║██║  ██║██╔══╝  ██║  ██║
╚█████╔╝██║  ██║██████╔╝███████╗██████╔╝
 ╚════╝ ╚═╝  ╚═╝╚═════╝ ╚══════╝╚═════╝ 
    🐍 Strike fast. Code faster! 🐍
            ]],
            keys = {
              { icon = " ", key = "f", desc = "Find File", action = ":Telescope find_files" },
              { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
              { icon = " ", key = "g", desc = "Find Text", action = ":Telescope live_grep" },
              { icon = " ", key = "r", desc = "Recent Files", action = ":Telescope oldfiles" },
              { icon = " ", key = "c", desc = "Config", action = ":Telescope find_files cwd=" .. vim.fn.stdpath("config") },
              { icon = " ", key = "d", desc = "Database UI", action = ":DBUI" },
              { icon = " ", key = "L", desc = "Lazy Plugin Manager", action = ":Lazy" },
              { icon = " ", key = "M", desc = "Mason LSP Manager", action = ":Mason" },
              { icon = " ", key = "q", desc = "Quit", action = ":qa" },
            },
          },
        },
      })
    end,
  },

  -- Status line
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    config = function()
      require("lualine").setup({
        options = {
          theme = "tokyonight",
          globalstatus = true,
        },
        sections = {
          lualine_a = {"mode"},
          lualine_b = {"branch", "diff", "diagnostics"},
          lualine_c = {"filename"},
          lualine_x = {"encoding", "fileformat", "filetype"},
          lualine_y = {"progress"},
          lualine_z = {"location"}
        },
      })
    end,
  },
}
