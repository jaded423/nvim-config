# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

**Multi-AI Documentation Setup**:
- **CLAUDE.md** is the source of truth - always edit this file
- **GEMINI.md** and **AGENTS.md** are symlinks to CLAUDE.md
- When you edit CLAUDE.md, all AI assistants automatically see the changes
- No manual syncing needed - symlinks handle it automatically!

## Repository Overview

This is a **personal Neovim configuration** built with Lua, using lazy.nvim for plugin management. The config is symlinked from `~/.config/nvim` to enable seamless editing and version control. Any changes made to `~/.config/nvim` automatically appear here for git tracking.

**Symlink relationship**: `~/.config/nvim -> ~/projects/nvimConfig`

## Quick Reference - Documentation Structure

This documentation is organized into focused, specialized files for easy navigation:

- **[docs/commands.md](docs/commands.md)** - All Neovim commands (testing, plugins, LSP, debugging, testing, AI, code quality, tree-sitter)
- **[docs/architecture.md](docs/architecture.md)** - System design, plugin organization, initialization flow, implementation details for all major features
- **[docs/workflows.md](docs/workflows.md)** - Step-by-step guides for modifying config, development workflow, common patterns
- **[docs/troubleshooting.md](docs/troubleshooting.md)** - Solutions for common issues across all subsystems
- **[docs/changelog.md](docs/changelog.md)** - Complete version history and feature additions

## Directory Structure

```
nvimConfig/
├── init.lua                    # Entry point
├── lua/
│   ├── config/                 # Core configuration
│   │   ├── options.lua         # Vim options
│   │   ├── keymaps.lua         # Global keybindings
│   │   ├── autocmds.lua        # Autocommands
│   │   └── lazy.lua            # Plugin manager bootstrap
│   └── plugins/                # Plugin configurations (organized by category)
│       ├── ai/
│       ├── coding/
│       ├── debug/
│       ├── editor/
│       ├── git/
│       ├── lsp/
│       ├── navigation/
│       ├── session/
│       ├── testing/
│       ├── tools/
│       ├── ui/
│       └── keybindings.lua
├── docs/                       # Documentation (this structure)
│   ├── commands.md
│   ├── architecture.md
│   ├── workflows.md
│   ├── troubleshooting.md
│   └── changelog.md
├── lazy-lock.json              # Pinned plugin versions (commit this)
├── .gitignore
├── .gitattributes              # Enforces LF line endings
└── CLAUDE.md                   # This file (source of truth)
```

## Version Requirements

- Neovim >= 0.9.4 (0.10+ recommended for animations and full feature support)
- Git (for lazy.nvim)
- ripgrep (for Telescope grep)
- Node.js (for some LSP servers and debuggers)
- Deno (for peek.nvim markdown preview)
- A Nerd Font (optional but recommended)
- GitHub Copilot subscription (optional, for AI features)

## External Dependencies

These must be installed separately (not via Mason):

```bash
# macOS
brew install ripgrep fd lazygit deno

# Ubuntu/Debian
apt install ripgrep fd-find
# For deno: https://deno.land/manual/getting_started/installation
```

## Important Files

- **lazy-lock.json** - Pinned plugin versions (commit this)
- **.gitignore** - Excludes lazy.nvim data directory
- **.gitattributes** - Enforces LF line endings
- **init.lua** - Entry point (minimal, delegates to config/)
- **lua/config/** - Core Neovim settings
- **lua/plugins/** - All plugin specifications

## Automated Backups

This repository is automatically backed up **every hour** as part of a unified dotfiles backup system.

**What's backed up:**
- This nvim-config repository
- Obsidian Vault
- ZSH Config (dotfiles-private)

**How to check:**
```bash
# View recent backup logs
tail -f /tmp/git_backup.log

# Manual backup test
bash ~/scripts/gitBackup.sh

# Check LaunchAgent status
launchctl list | grep gitbackup
```

You'll receive an email notification after each hourly backup showing the status of all three repositories.

## Resources

- [Lazy.nvim Docs](https://github.com/folke/lazy.nvim)
- [Mason Registry](https://mason-registry.dev/)
- [Neovim Lua Guide](https://neovim.io/doc/user/lua-guide.html)
- [Config on GitHub](https://github.com/jaded423/nvimConfig)
- [nvim-dap Docs](https://github.com/mfussenegger/nvim-dap)
- [neotest Docs](https://github.com/nvim-neotest/neotest)
- [GitHub Copilot](https://github.com/features/copilot)

## File Naming Conventions

- **Markdown files**: Use camelCase (e.g., `gitStages.md`, `obsidianSetup.md`) instead of hyphens or underscores
- Plugin configs: Use descriptive names matching the plugin's purpose
- Multi-plugin files: Group by category (e.g., `editor.lua` for multiple editing plugins)
- Nested directories: Organize by function (lsp/, ui/, editor/, etc.)

## When Updating Plugins

1. Check breaking changes: `:Lazy log`
2. Update: `:Lazy update`
3. Test config: `:checkhealth`
4. Commit lock file: `git add lazy-lock.json && git commit -m "chore: Update plugins"`

---

**Full changelog**: [docs/changelog.md](docs/changelog.md)
