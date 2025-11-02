# Obsidian.nvim Quick Start Guide

This guide explains how to use your new Obsidian.nvim setup for efficient note-taking in Neovim.

## 🚀 Quick Start

### Essential Keybindings (All start with `<leader>o`)

**Quick Capture (Most Important!):**
- `<leader>oN` - **Quick note in floating window** (Recommended!)
- `<leader>on` - New note in current window
- `<leader>om` - Meeting note (floating window with template)
- `<leader>op` - Person/contact note (floating window with template)
- `<leader>oP` - Project note (floating window with template)

**Daily Notes:**
- `<leader>od` - Open today's daily note
- `<leader>oD` - Open today's daily note in floating window
- `<leader>oy` - Yesterday's note
- `<leader>ot` - Tomorrow's note

**Search & Navigation:**
- `<leader>of` - Find notes (fuzzy search by title)
- `<leader>os` - Search inside notes (grep content)
- `<leader>oq` - Quick switch between notes
- `<leader>ob` - Show backlinks to current note
- `<leader>ol` - Show all links in current note
- `<leader>oT` - Browse by tags

**Templates & Organization:**
- `<leader>oi` - Insert template
- `<leader>ow` - Switch workspace/vault
- `<leader>or` - Rename note (updates all links!)
- `<leader>oo` - Open current note in Obsidian app

**Link Navigation:**
- `gf` - Follow link under cursor (works with `[[wiki links]]`)

## 📝 Typical Workflows

### Workflow 1: Quick Note Capture (Recommended!)

This is the **fastest way** to capture ideas:

1. Press `<leader>oN` anywhere in Neovim
2. A centered floating window appears
3. You're prompted for a note title
4. Start typing immediately
5. Save with `:w` or `<leader>w`
6. Close with `:q` or `<leader>q`
7. Note automatically saved to `inbox/` folder

**Why this is great:** No context switching, stays on top, lets you quickly dump thoughts.

### Workflow 2: Daily Note Journaling

Start your day with a daily note:

1. Open Neovim
2. Press `<leader>od` (or `<leader>oD` for floating)
3. Daily note opens with today's template
4. Add your schedule, tasks, notes
5. Link to projects: `[[project-name]]`
6. Add tags: `#important` `#follow-up`

**Daily note location:** `daily/2025-11-01.md`

### Workflow 3: Meeting Notes

During a meeting:

1. Press `<leader>om` (meeting note in floating window)
2. Enter meeting title (e.g., "Team Standup")
3. Template auto-fills: attendees, agenda, action items
4. Take notes in real-time
5. Add action items with checkboxes: `- [ ] Task`
6. Link to related people: `[[People/John Doe]]`
7. Save and close

**Meeting note location:** `inbox/team-standup.md` (move to `meetings/` later)

### Workflow 4: Project Management

Start a new project:

1. Press `<leader>oP` (project note)
2. Enter project name
3. Fill in:
   - Objectives
   - Milestones with checkboxes
   - Stakeholders
   - Resources
4. Update status as you progress
5. Link from daily notes: `Worked on [[Projects/new-feature]]`

### Workflow 5: Weekly Review & Inbox Processing

Process your inbox folder:

1. Press `<leader>of` to open note finder
2. Type "inbox" to see all quick-captured notes
3. For each note:
   - Add proper tags
   - Link to projects/people
   - Move to correct folder (use `:ObsidianRename`)
4. Move processed notes out of inbox

## 🎯 Advanced Tips

### Creating Wiki Links

While editing, just type:
```markdown
[[note-name]]        # Creates link
[[note-name|alias]]  # Link with custom text
```

Auto-completion works! Start typing `[[` and your notes appear.

### Using Tags

Add tags anywhere:
```markdown
#project #urgent #follow-up
```

Search by tag: `<leader>oT` then select tag

### Checkbox Tasks

Create interactive checkboxes:
```markdown
- [ ] Unchecked task
- [x] Completed task
- [>] Forwarded task
- [~] Cancelled task
```

**In Neovim, these render with fancy icons!**

### Linking to Specific Sections

Link to headings within notes:
```markdown
[[note-name#Section Title]]
```

### Embedding Notes

Include another note's content:
```markdown
![[note-name]]
```

### Daily Note Linking

Your daily notes auto-link to previous/next:
```markdown
**Previous:** [[2025-10-31]]
**Next:** [[2025-11-02]]
```

Click these to navigate through your journal.

### Finding Related Notes

1. Open a note
2. Press `<leader>ob` to see all notes that link to this one (backlinks)
3. Press `<leader>ol` to see all links from this note

This creates a web of knowledge!

## 📂 Folder Organization (PARA Method)

Your vault uses the PARA method:

```
inbox/          ← Quick captures (unsorted)
daily/          ← Daily journal entries
projects/       ← Active projects with deadlines
people/         ← Contacts and relationships
meetings/       ← Meeting notes
resources/      ← Reference materials (books, articles)
templates/      ← Note templates
attachments/    ← Images, PDFs, files
```

**Rule:** Everything starts in `inbox/`, then gets filed appropriately.

## 🔧 Setup Required (First Time Only)

### 1. Create Folder Structure

Run this in your terminal **once**:

```bash
cd "/Users/joshuabrown/Library/CloudStorage/GoogleDrive-joshua@elevatedtrading.com/My Drive/Elevated Vault"

mkdir -p inbox daily projects people meetings resources templates attachments
```

### 2. Create Template Files

Copy templates from `OBSIDIAN_TEMPLATES.md` into:
```
/Users/joshuabrown/Library/CloudStorage/GoogleDrive-joshua@elevatedtrading.com/My Drive/Elevated Vault/templates/
```

**Required templates:**
- `daily.md` - For daily notes
- `meeting.md` - For meeting notes
- `person.md` - For contacts
- `project.md` - For projects
- `quick.md` - For quick captures

### 3. Reload Neovim

After setup:
```vim
:Lazy sync          " Sync plugins
:source $MYVIMRC    " Reload config
```

Or restart Neovim.

## 🎨 Visual Features

Your config includes fancy UI enhancements:

- ✅ Checkboxes render with icons
- 🔗 Links are highlighted and underlined
- 🏷️  Tags are styled differently
- 📝 External links have indicators

These work automatically when editing `.md` files!

## 🔍 Searching Your Vault

### By Title
```
<leader>of  → Type partial title → Enter
```

### By Content
```
<leader>os  → Type search term → Enter
```

### By Tag
```
<leader>oT  → Select tag → Enter
```

### Recent Notes
```
<leader>fo  → Shows recent files (Telescope)
```

## 💡 Pro Tips

### 1. **Use Floating Windows for Quick Capture**
   - `<leader>oN` is your best friend for capturing ideas fast

### 2. **Link Everything**
   - Don't organize, just link
   - Use `[[links]]` liberally
   - Let backlinks show relationships

### 3. **Process Inbox Weekly**
   - Set recurring task to review inbox/
   - Move notes to proper folders
   - Add tags and links

### 4. **Start Small**
   - Just use `<leader>oN` and `<leader>od` for first week
   - Add more workflows as you get comfortable

### 5. **Daily Note Ritual**
   - `<leader>od` every morning
   - Review yesterday's note
   - Plan today
   - Link to projects you'll work on

### 6. **Meeting Notes Workflow**
   - `<leader>om` at meeting start
   - Capture action items as checkboxes
   - Link to attendees: `[[People/Name]]`
   - Review at end of day

## 🐛 Troubleshooting

### "ObsidianNew not found"
- Plugin might not be loaded
- Run `:Lazy sync`
- Restart Neovim

### Templates not working
- Check templates exist in `templates/` folder
- Verify folder path in config
- Template names must match (without `.md`)

### Floating window doesn't appear
- Check for errors: `:messages`
- Verify helper file loaded: `:lua print(vim.inspect(require("config.obsidian-helpers")))`

### Links don't auto-complete
- Only works in `.md` files
- Make sure you're in insert mode
- Type `[[` to trigger completion

### Checkboxes don't render
- Check you're in a markdown file (`:set ft?`)
- Run `:checkhealth obsidian`

## 📊 Feature Comparison

| Feature | Standard `<leader>on` | Floating `<leader>oN` |
|---------|---------------------|---------------------|
| Speed | Fast | Fast |
| Visibility | Current window | Centered popup |
| Context switching | Yes (changes buffer) | No (stays on top) |
| Best for | Long notes | Quick captures |

**Recommendation:** Use `<leader>oN` for quick ideas, `<leader>on` for longer writing.

## 🎓 Learning Path

**Week 1:** Master these
- `<leader>oN` - Quick notes
- `<leader>od` - Daily notes
- `<leader>of` - Find notes

**Week 2:** Add these
- `<leader>om` - Meeting notes
- `<leader>oi` - Templates
- `[[links]]` - Linking notes

**Week 3:** Advanced
- `<leader>ob` - Backlinks
- `<leader>oT` - Tag browsing
- Inbox processing workflow

## 🔗 Resources

- [Obsidian.nvim GitHub](https://github.com/epwalsh/obsidian.nvim)
- [Obsidian Help](https://help.obsidian.md/)
- [PARA Method](https://fortelabs.com/blog/para/)
- Your template examples: `OBSIDIAN_TEMPLATES.md`
- Your config: `lua/plugins/tools/obsidian.lua`
- Helper functions: `lua/config/obsidian-helpers.lua`

## 📝 Quick Reference Card

Print this and keep near your desk:

```
QUICK CAPTURE
  <leader>oN    Quick note (floating)
  <leader>om    Meeting note
  <leader>od    Daily note

SEARCH
  <leader>of    Find notes
  <leader>os    Search content
  <leader>oT    Browse tags

NAVIGATION
  gf            Follow link
  <leader>ob    Show backlinks
  <leader>ol    Show links

ORGANIZATION
  <leader>oi    Insert template
  <leader>or    Rename note
  <leader>ow    Switch vault
```

---

**Happy note-taking! 📔✨**

Remember: The best note-taking system is the one you actually use. Start simple, build habits, then add complexity.
