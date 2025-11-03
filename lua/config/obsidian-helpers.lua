-- Custom Obsidian helper functions
-- This file contains additional utilities for working with Obsidian notes

local M = {}

--- Open a floating window for quick note capture
--- Creates a centered floating window and immediately starts a new Obsidian note
function M.quick_note()
  -- Create a new buffer
  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_option(buf, "bufhidden", "wipe")
  vim.api.nvim_buf_set_option(buf, "filetype", "markdown")

  -- Get editor dimensions
  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)

  -- Calculate position for centered window
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  -- Window configuration
  local opts = {
    relative = "editor",
    row = row,
    col = col,
    width = width,
    height = height,
    border = "rounded",
    style = "minimal",
    title = " Quick Note ",
    title_pos = "center",
  }

  -- Open the floating window
  local win = vim.api.nvim_open_win(buf, true, opts)

  -- Set window options
  vim.api.nvim_win_set_option(win, "cursorline", true)
  vim.api.nvim_win_set_option(win, "number", true)
  vim.api.nvim_win_set_option(win, "relativenumber", true)

  -- Create a new Obsidian note in the floating window
  vim.cmd("ObsidianNew")
end

--- Create a quick note with a specific template
--- @param template_name string The name of the template (without .md extension)
function M.quick_note_with_template(template_name)
  M.quick_note()
  -- Wait a bit for the note to be created, then clear and insert template
  vim.defer_fn(function()
    -- Clear the buffer (removes auto-generated heading)
    vim.api.nvim_buf_set_lines(0, 0, -1, false, {})
    -- Insert the template (which has proper frontmatter at top)
    vim.cmd("ObsidianTemplate " .. template_name)
  end, 100)
end

--- Create a meeting note in a floating window (will move to 03-meetings/ on first save)
function M.meeting_note()
  M.quick_note_with_template("meeting")
end

--- Create a person/contact note in a floating window (will move to 02-contacts/ on first save)
function M.person_note()
  M.quick_note_with_template("person")
end

--- Create a project note in a floating window (will move to 01-projects/ on first save)
function M.project_note()
  M.quick_note_with_template("project")
end

--- Parse frontmatter from the current buffer and extract the 'type' field
--- @return string|nil The note type from frontmatter, or nil if not found
function M.get_note_type()
  local lines = vim.api.nvim_buf_get_lines(0, 0, 30, false) -- Check first 30 lines
  local in_frontmatter = false
  local note_type = nil
  local frontmatter_count = 0

  for _, line in ipairs(lines) do
    if line:match("^---+$") then
      frontmatter_count = frontmatter_count + 1
      if frontmatter_count == 1 then
        in_frontmatter = true -- Start of frontmatter
      elseif frontmatter_count == 2 then
        break -- End of first frontmatter block
      end
    elseif in_frontmatter then
      -- Look for "type: something" (trim whitespace)
      local type_match = line:match("^%s*type:%s*(.+)%s*$")
      if type_match then
        note_type = vim.trim(type_match)
        -- Don't break yet - keep looking in case there are multiple type fields
      end
    end
  end

  return note_type
end

--- Auto-organize note on save based on frontmatter type
--- This function checks the note's 'type' field and moves it to the appropriate folder
function M.auto_organize_note()
  local current_file = vim.api.nvim_buf_get_name(0)
  if current_file == "" or not current_file:match("%.md$") then
    return
  end

  local vault_path = "/Users/joshuabrown/Library/CloudStorage/GoogleDrive-joshua@elevatedtrading.com/My Drive/Elevated Vault"

  -- Only process files in the vault
  if not current_file:match(vim.pesc(vault_path)) then
    return
  end

  -- Map note types to folders
  local type_to_folder = {
    person = "02-contacts",
    contact = "02-contacts",
    meeting = "03-meetings",
    project = "01-projects",
  }

  local note_type = M.get_note_type()
  if not note_type then
    -- Debug: show that no type was found
    -- vim.notify("No type found in frontmatter", vim.log.levels.DEBUG)
    return -- No type in frontmatter, don't move
  end

  local target_folder = type_to_folder[note_type]
  if not target_folder then
    -- Debug: unknown type
    vim.notify(
      string.format("Unknown note type '%s' - not auto-organizing", note_type),
      vim.log.levels.WARN
    )
    return -- Unknown type, don't move
  end

  local target_path_base = vault_path .. "/" .. target_folder

  -- Check if already in the correct folder
  if current_file:match(vim.pesc(target_path_base)) then
    return -- Already in the right place
  end

  -- Build new path
  local filename = vim.fn.fnamemodify(current_file, ":t")
  local new_path = target_path_base .. "/" .. filename

  -- Check if target file already exists
  if vim.fn.filereadable(new_path) == 1 then
    vim.notify(
      string.format("Cannot move - file already exists: %s", new_path),
      vim.log.levels.ERROR
    )
    return
  end

  -- Create folder if it doesn't exist
  vim.fn.mkdir(target_path_base, "p")

  -- Move the file using vim.fn.rename (more reliable than vim.loop.fs_rename)
  local success = vim.fn.rename(current_file, new_path)
  if success == 0 then
    -- Update the buffer to point to the new location
    vim.cmd("edit! " .. vim.fn.fnameescape(new_path))

    -- Ensure rendering is re-enabled after file move
    -- Use longer delay to ensure buffer is fully loaded and filetype is detected
    vim.defer_fn(function()
      -- Let Neovim detect filetype naturally from .md extension
      if vim.bo.filetype ~= "markdown" then
        vim.bo.filetype = "markdown"
      end

      -- Trigger all markdown FileType autocmds (conceallevel, wrapping, etc.)
      vim.cmd("doautocmd FileType markdown")

      -- Wait a tiny bit more, then explicitly enable render-markdown
      vim.defer_fn(function()
        local ok, render_markdown = pcall(require, "render-markdown")
        if ok then
          render_markdown.enable()
        end
      end, 50)
    end, 150)

    vim.notify(string.format("📁 Moved to %s/", target_folder), vim.log.levels.INFO)
  else
    vim.notify("Failed to move note", vim.log.levels.ERROR)
  end
end

--- Search for notes with a specific tag using Telescope
--- @param tag string The tag to search for (without #)
function M.search_by_tag(tag)
  require("telescope.builtin").live_grep({
    prompt_title = "Notes with #" .. tag,
    search_dirs = {
      vim.fn.expand("~/Library/CloudStorage/GoogleDrive-joshua@elevatedtrading.com/My Drive/Elevated Vault"),
    },
    default_text = "#" .. tag,
  })
end

--- Open today's daily note in a floating window
function M.daily_note_floating()
  M.quick_note()
  vim.defer_fn(function()
    vim.cmd("ObsidianToday")
  end, 100)
end

return M
