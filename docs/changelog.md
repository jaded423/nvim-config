# Changelog

## November 3, 2025 - Added to Unified Automated Backup System

**Change**: nvim-config added to hourly automated backup alongside Obsidian vault and ZSH config.

**Benefits:**
- Automatic hourly backups to GitHub
- Consolidated email notifications for all dotfiles
- No manual intervention needed
- Robust retry logic for git operations

**Script**: `~/scripts/gitBackup.sh`

---

## November 3, 2025 - Converted Obsidian Vault to camelCase Naming

**Problem:**
- Obsidian vault had inconsistent file naming: hyphens, underscores, spaces, various capitalizations
- 1,326 markdown files using different conventions
- Wanted uniform camelCase naming for consistency and ease of use

**Solution:**
- Created Python script to rename all .md files to camelCase
- Implemented smart rules:
  - **Dates moved to end**: `11.02.25 Sermon.md` → `Sermon110225.md`
  - **Numbers attached directly**: `Eph 5.md` → `Eph5.md`
  - **First letter capitalized**: `jay-brown.md` → `jayBrown.md`
  - **Remove separators**: Hyphens, underscores, spaces → camelCase
- Automatically updated all [[wikilinks]] throughout vault (scanned all 1,326 files)

**Results:**
- **1,270 files renamed** successfully
- All internal [[wikilinks]] updated automatically
- No broken links
- Uniform, clean naming convention across entire vault

**Script location:** `/tmp/rename_vault_to_camelcase.py`

**Added to CLAUDE.md:** File naming convention rule (line 627) specifying markdown files should use camelCase - this rule persists through `/compact` operations

---

## November 3, 2025 - Switched to Symlinks for Multi-AI Documentation

**Previous Approach:**
- GEMINI.md and AGENTS.md were full copies of CLAUDE.md
- Required running `/sync-ai-docs` command after every change
- Used 500-1000 tokens per sync operation
- Easy to forget to sync, leading to outdated documentation

**New Approach:**
- GEMINI.md and AGENTS.md are now symlinks to CLAUDE.md
- Editing CLAUDE.md instantly updates all AI assistant documentation
- Zero tokens needed for syncing
- No manual commands required - just edit CLAUDE.md

**Implementation:**
```bash
rm GEMINI.md AGENTS.md
ln -s CLAUDE.md GEMINI.md
ln -s CLAUDE.md AGENTS.md
```

**Benefits:**
- Saves tokens (no more sync operations)
- Always in sync (no manual step to forget)
- Simpler workflow (just edit CLAUDE.md)
- Git tracks symlinks (tiny 9-byte pointers)

**Cleanup:**
- Removed all project-specific slash commands
- Removed global `/sync-ai-docs` command (no longer needed with symlinks)
- Only `/compact` remains as a global command for monthly archival

---

## November 3, 2025 - Fixed Markdown Rendering Persistence After Auto-Organization

**Problem:**
- When Obsidian notes were auto-moved to their target folders (`03-meetings/`, `02-contacts/`, `01-projects/`), the markdown rendering would disappear
- render-markdown.nvim stopped working after file relocation
- peek.nvim markdown preview also failed for moved files

**Root Cause:**
- The `auto_organize_note()` function used `edit!` to reload the buffer at the new path
- This didn't properly re-trigger the FileType event
- render-markdown and peek.nvim couldn't recognize the file as markdown anymore

**Solution (lua/config/obsidian-helpers.lua:173-191):**
- Implemented two-stage delay approach:
  1. **150ms delay** - Let Neovim detect `.md` filetype naturally and trigger FileType autocmds
  2. **+50ms delay** - Explicitly call `render_markdown.enable()` to ensure rendering activates
- Fixed "Not a supported filetype: markdown" warning that appeared during auto-organization
- Ensures all markdown settings (conceallevel, wrapping) are re-applied after file move

**Impact:**
- Markdown rendering now persists beautifully after auto-organization
- peek.nvim works correctly for auto-organized notes
- No more warnings or broken rendering after saving template notes

---

## November 3, 2025 - Fixed Statusline Hidden Directory Display

**Problem:**
- When browsing a hidden directory (starting with `.`) in netrw, the statusline showed `[No Name]` instead of the directory name
- Example: In `~/.claude/`, statusline showed `Users/joshuabrown > [No Name]`
- But in `~/.claude/commands/`, it correctly showed `.claude/commands > commands`

**Root Cause (lua/plugins/ui/lualine.lua:7-15):**
- The `cwd()` function used `expand("%:p:h")` which returns the *parent* directory of the buffer
- When viewing a directory itself in netrw, this returned the parent instead of the actual directory
- For `.claude/`, it got `/Users/joshuabrown/` and displayed `Users/joshuabrown` (missing `.claude`)
- For `.claude/commands/`, it worked because it showed the file's directory structure

**Solution:**
- Changed from `expand("%:p:h")` to `expand("%:p")` to get the full buffer path
- Added logic to detect directory buffers using `isdirectory()` check
- Separated handling for three cases:
  1. Empty/no buffer → use `getcwd()` (current working directory)
  2. Directory buffer (netrw) → show the directory itself with parent/current
  3. Regular file → show the file's directory with parent/current structure

**Impact:**
- Hidden directories now display correctly in statusline: `joshuabrown/.claude`
- Works for all directory navigation scenarios (netrw, oil.nvim, etc.)
- Regular file buffers continue to work as before
- More consistent and accurate directory representation in statusline
