return {
  "epwalsh/obsidian.nvim",
  version = "*", -- Use latest release
  lazy = true,
  ft = "markdown", -- Only load when opening markdown files (performance!)
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  keys = {
    -- Quick note capture
    { "<leader>on", "<cmd>ObsidianNew<cr>", desc = "Obsidian: New note" },
    { "<leader>oq", "<cmd>ObsidianQuickSwitch<cr>", desc = "Obsidian: Quick switch" },

    -- Template-specific notes (auto-saved to correct folders)
    {
      "<leader>onm",
      function()
        require("config.obsidian-helpers").meeting_note()
      end,
      desc = "Obsidian: New meeting (→ 03-meetings/)",
    },
    {
      "<leader>onp",
      function()
        require("config.obsidian-helpers").person_note()
      end,
      desc = "Obsidian: New contact (→ 02-contacts/)",
    },
    {
      "<leader>onP",
      function()
        require("config.obsidian-helpers").project_note()
      end,
      desc = "Obsidian: New project (→ 01-projects/)",
    },

    -- Daily notes
    { "<leader>od", "<cmd>ObsidianToday<cr>", desc = "Obsidian: Today's note" },
    { "<leader>oy", "<cmd>ObsidianYesterday<cr>", desc = "Obsidian: Yesterday's note" },
    { "<leader>ot", "<cmd>ObsidianTomorrow<cr>", desc = "Obsidian: Tomorrow's note" },

    -- Search and navigation
    { "<leader>of", "<cmd>ObsidianQuickSwitch<cr>", desc = "Obsidian: Find notes" },
    { "<leader>os", "<cmd>ObsidianSearch<cr>", desc = "Obsidian: Search notes" },
    { "<leader>ob", "<cmd>ObsidianBacklinks<cr>", desc = "Obsidian: Backlinks" },
    { "<leader>ol", "<cmd>ObsidianLinks<cr>", desc = "Obsidian: Links" },
    { "<leader>oT", "<cmd>ObsidianTags<cr>", desc = "Obsidian: Tags" },

    -- Templates and workspace
    { "<leader>oi", "<cmd>ObsidianTemplate<cr>", desc = "Obsidian: Insert template" },
    { "<leader>ow", "<cmd>ObsidianWorkspace<cr>", desc = "Obsidian: Switch workspace" },

    -- Advanced
    { "<leader>or", "<cmd>ObsidianRename<cr>", desc = "Obsidian: Rename note" },
    { "<leader>oo", "<cmd>ObsidianOpen<cr>", desc = "Obsidian: Open in app" },

    -- Follow links in markdown files
    {
      "gf",
      function()
        if require("obsidian").util.cursor_on_markdown_link() then
          return "<cmd>ObsidianFollowLink<cr>"
        else
          return "gf"
        end
      end,
      desc = "Obsidian: Follow link",
      expr = true,
      buffer = true,
    },
  },
  opts = {
    workspaces = {
      {
        name = "elevated",
        path = "/Users/joshuabrown/Library/CloudStorage/GoogleDrive-joshua@elevatedtrading.com/My Drive/Elevated Vault",
      },
      -- You can add more vaults here if needed:
      -- {
      --   name = "personal",
      --   path = "~/Documents/PersonalVault",
      -- },
    },

    -- Daily notes configuration
    daily_notes = {
      folder = "daily",
      date_format = "%Y-%m-%d",
      alias_format = "%B %-d, %Y", -- "January 1, 2024"
      template = "daily.md",
    },

    -- Templates configuration
    templates = {
      folder = "templates",
      date_format = "%Y-%m-%d",
      time_format = "%H:%M",
      -- Custom substitutions (available in templates as {{variable}})
      substitutions = {
        yesterday = function()
          return os.date("%Y-%m-%d", os.time() - 86400)
        end,
        tomorrow = function()
          return os.date("%Y-%m-%d", os.time() + 86400)
        end,
      },
    },

    -- Where to put new notes created from quick capture
    new_notes_location = "inbox",

    -- Custom note ID function (slugified title with timestamp fallback)
    note_id_func = function(title)
      -- If no title provided, use timestamp
      if title == nil then
        return tostring(os.date("%Y%m%d%H%M%S"))
      end
      -- Slugify the title: lowercase, replace spaces with hyphens, remove special chars
      local slug = title:gsub("%s+", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
      return slug
    end,

    -- Disable auto-generate frontmatter (templates provide their own)
    -- This prevents duplicate frontmatter when using templates
    disable_frontmatter = true,

    -- Customize how note links are displayed
    ui = {
      enable = true,
      checkboxes = {
        [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
        ["x"] = { char = "", hl_group = "ObsidianDone" },
        [">"] = { char = "", hl_group = "ObsidianRightArrow" },
        ["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
      },
      external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
      reference_text = { hl_group = "ObsidianRefText" },
      highlight_text = { hl_group = "ObsidianHighlightText" },
      tags = { hl_group = "ObsidianTag" },
      hl_groups = {
        ObsidianTodo = { bold = true, fg = "#f78c6c" },
        ObsidianDone = { bold = true, fg = "#89ddff" },
        ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
        ObsidianTilde = { bold = true, fg = "#ff5370" },
        ObsidianRefText = { underline = true, fg = "#c792ea" },
        ObsidianExtLinkIcon = { fg = "#c792ea" },
        ObsidianTag = { italic = true, fg = "#89ddff" },
        ObsidianHighlightText = { bg = "#75662e" },
      },
    },

    -- Disable nvim-cmp integration (we're using blink.cmp)
    completion = {
      nvim_cmp = false,
      min_chars = 2,
    },

    -- Specify how to name wiki links
    wiki_link_func = function(opts)
      if opts.id == nil then
        return string.format("[[%s]]", opts.label)
      elseif opts.label ~= opts.id then
        return string.format("[[%s|%s]]", opts.id, opts.label)
      else
        return string.format("[[%s]]", opts.id)
      end
    end,
  },
}
