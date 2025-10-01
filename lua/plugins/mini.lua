return {
  -- Surround actions (add, delete, replace surrounding characters)
  {
    "echasnovski/mini.surround",
    event = "VeryLazy",
    opts = {
      mappings = {
        add = "sa",            -- Add surrounding in Normal and Visual modes
        delete = "sd",         -- Delete surrounding
        find = "sf",           -- Find surrounding (to the right)
        find_left = "sF",      -- Find surrounding (to the left)
        highlight = "sh",      -- Highlight surrounding
        replace = "sr",        -- Replace surrounding
        update_n_lines = "sn", -- Update `n_lines`
      },
    },
  },

  -- Extended textobjects (a/i)
  {
    "echasnovski/mini.ai",
    event = "VeryLazy",
    opts = function()
      local ai = require("mini.ai")
      return {
        n_lines = 500,
        custom_textobjects = {
          o = ai.gen_spec.treesitter({
            a = { "@block.outer", "@conditional.outer", "@loop.outer" },
            i = { "@block.inner", "@conditional.inner", "@loop.inner" },
          }, {}),
          f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }, {}),
          c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }, {}),
          t = { "<([%p%w]-)%f[^<%w][^<>]->.-</%1>", "^<.->().*()</[^/]->$" },
        },
      }
    end,
  },

  -- File explorer (modern column-based file manager)
  {
    "echasnovski/mini.files",
    keys = {
      {
        "<leader>fm",
        function()
          require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
        end,
        desc = "Open mini.files (directory of current file)",
      },
      {
        "<leader>fM",
        function()
          require("mini.files").open(vim.loop.cwd(), true)
        end,
        desc = "Open mini.files (cwd)",
      },
    },
    opts = {
      windows = {
        preview = true,
        width_focus = 30,
        width_preview = 30,
      },
      options = {
        use_as_default_explorer = false,
      },
      mappings = {
        close = 'q',
        go_in = '<CR>',
        go_in_plus = 'L',
        go_out = '-',
        go_out_plus = 'H',
        reset = '<BS>',
        reveal_cwd = '@',
        show_help = 'g?',
        synchronize = '=',
        trim_left = '<',
        trim_right = '>',
      },
    },
    config = function(_, opts)
      require("mini.files").setup(opts)
    end,
  },

  -- Jump to any location (hop/leap alternative)
  {
    "echasnovski/mini.jump2d",
    event = "VeryLazy",
    opts = {
      mappings = {
        start_jumping = "<leader>j", -- Changed from "<CR>" to avoid conflict
      },
    },
  },

  -- Navigate with square brackets
  {
    "echasnovski/mini.bracketed",
    event = "VeryLazy",
    opts = {},
  },

  -- Highlight patterns (like color codes)
  {
    "echasnovski/mini.hipatterns",
    event = "VeryLazy",
    opts = function()
      local hi = require("mini.hipatterns")
      return {
        highlighters = {
          hex_color = hi.gen_highlighter.hex_color(),
        },
      }
    end,
  },

  -- Trailing whitespace management
  {
    "echasnovski/mini.trailspace",
    event = "VeryLazy",
    opts = {},
  },
}
