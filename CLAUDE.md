# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

**Multi-AI Documentation Setup**:
- **CLAUDE.md** is the source of truth - always edit this file
- **GEMINI.md** and **AGENTS.md** are copies for Google Gemini and other AI assistants
- To sync changes: Run `/sync-ai-docs` command (copies CLAUDE.md to others)
- Sync before commits to keep all AI assistants on the same page

## Repository Overview

This is a **personal Neovim configuration** built with Lua, using lazy.nvim for plugin management. The config is symlinked from `~/.config/nvim` to enable seamless editing and version control. Any changes made to `~/.config/nvim` automatically appear here for git tracking.

**Symlink relationship**: `~/.config/nvim -> ~/projects/nvim-config`

## Testing Configuration Changes

```bash
# Test the config loads without errors
nvim --headless "+checkhealth" +qa

# Test with minimal startup
nvim --clean

# Launch normally (plugins auto-install on first run)
nvim

# Check LSP status
nvim -c "LspInfo"

# Check plugin manager
nvim -c "Lazy"

# Full health check
nvim -c "checkhealth"
```

## Plugin Management Commands

```vim
:Lazy              " Open plugin manager UI
:Lazy sync         " Update/install all plugins
:Lazy clean        " Remove unused plugins
:Lazy update       " Update all plugins
:Lazy profile      " Profile startup time
:Lazy log          " View recent updates
```

## LSP & Tools Management

```vim
:Mason             " Open Mason UI for LSP/formatters/linters/debuggers
:MasonInstall <tool>    " Install a specific tool
:MasonUpdate       " Update all Mason packages
:LspInfo           " Check active LSP servers
:LspRestart        " Restart LSP servers
:LspLog            " View LSP logs
```

## Debugging Commands (nvim-dap)

```vim
" DAP commands
:DapContinue       " Start/continue debugging
:DapToggleBreakpoint " Toggle breakpoint at current line
:DapStepOver       " Step over
:DapStepInto       " Step into
:DapStepOut        " Step out
:DapTerminate      " Stop debugging

" Keybindings (leader = Space)
<leader>db         " Toggle breakpoint
<leader>dc         " Continue/start debugging
<leader>di         " Step into
<leader>do         " Step over
<leader>dO         " Step out
<leader>dr         " Toggle REPL
<leader>du         " Toggle DAP UI
<leader>dx         " Terminate debugger
```

## Testing Commands (neotest)

```vim
" Test runner commands
:Neotest summary   " Open test summary
:Neotest output    " Show test output
:Neotest run       " Run nearest test

" Keybindings
<leader>tt         " Run nearest test
<leader>tf         " Run test file
<leader>ta         " Run all tests
<leader>ts         " Toggle test summary
<leader>to         " Show test output
<leader>tw         " Toggle watch mode
```

## AI Assistance Commands (GitHub Copilot)

```vim
" Copilot setup
:Copilot setup     " Authenticate with GitHub
:Copilot status    " Check connection status

" CopilotChat commands
:CopilotChat       " Open chat
:CopilotChatExplain " Explain code
:CopilotChatReview  " Review code
:CopilotChatTests   " Generate tests
:CopilotChatFix     " Fix diagnostic

" Keybindings
<M-l>              " Accept suggestion
<M-]>              " Next suggestion
<M-[>              " Previous suggestion
<leader>ai         " Toggle Copilot Chat
<leader>aq         " Quick chat
<leader>ap         " Copilot actions popup
```

## Code Quality Commands

```vim
:ConformInfo       " Check formatter status and configuration
:FormatDisable     " Disable format-on-save for current buffer
:FormatDisable!    " Disable format-on-save globally
:FormatEnable      " Re-enable format-on-save

" Manual formatting
<leader>cf         " Format current buffer/selection

" Manual linting
<leader>cl         " Trigger linting for current file
```

## Tree-sitter Commands

```vim
:TSUpdate          " Update all parsers
:TSInstall <lang>  " Install parser for specific language
:TSModuleInfo      " Show loaded modules
:TSPlaygroundToggle " Inspect syntax tree
```

## Architecture

### Initialization Flow

1. **init.lua** - Entry point that sets leader key and loads core modules
2. **lua/config/options.lua** - Vim options (UI, search, indentation)
3. **lua/config/keymaps.lua** - Global keybindings
4. **lua/config/autocmds.lua** - Autocommands and event handlers
5. **lua/config/lazy.lua** - Bootstraps lazy.nvim and imports plugin specs

### Plugin Organization

Plugins are organized by category in `lua/plugins/`:

- **ai/** - AI assistance (NEW)
  - `copilot.lua` - GitHub Copilot + CopilotChat for code generation and explanations

- **coding/** - Language-specific features
  - `syntax.lua` - Tree-sitter configuration
  - `render-markdown.lua` - Markdown rendering
  - `todo-comments.lua` - Highlight and search TODO/FIXME/HACK comments (NEW)
  - `refactoring.nvim` - Advanced refactoring operations (extract, inline, etc.) (NEW)
  - `peek.lua` - Live Markdown preview with GitHub-style rendering (NEW)

- **debug/** - Debugging tools (NEW)
  - `nvim-dap.lua` - Complete DAP debugging suite (dap, dap-ui, virtual-text, mason-dap)

- **editor/** - Editing utilities
  - `editor.lua` - Autopairs, comments, oil.nvim file explorer
  - `mini.lua` - Collection of mini.nvim modules (surround, ai textobjects, files, jump2d, etc.)
  - `smart-splits.lua` - Smart split navigation and resizing (tmux-aware) (NEW)

- **git/** - Git integration
  - `git.lua` - gitsigns.nvim for hunks and inline blame
  - `diffview.lua` - Superior diff viewer with 3-way merge conflict resolution (NEW)

- **lsp/** - Language server configuration
  - `lsp.lua` - LSP servers via mason.nvim (uses `vim.lsp.config` API)
  - `completion.lua` - blink.cmp (modern completion engine)
  - `formatting.lua` - conform.nvim (formatting) + nvim-lint (linting)
  - `typescript-tools.lua` - Enhanced TypeScript/JavaScript LSP with inlay hints (NEW)

- **navigation/** - File and code navigation
  - `telescope.lua` - Fuzzy finder (files, grep, buffers)
  - `navigation.lua` - trouble.nvim (diagnostics) + aerial.nvim (symbols)

- **session/** - Session management (NEW)
  - `persistence.lua` - Automatic session persistence and restoration per project

- **testing/** - Test framework (NEW)
  - `neotest.lua` - Unified test runner with Jest, Vitest, Python, and Go adapters

- **tools/** - Utility tools (NEW)
  - `kulala.lua` - REST client for testing APIs with .http files

- **ui/** - User interface enhancements
  - `snacks.lua` - Multi-feature plugin (dashboard, notifications, terminal, zen mode)
  - `lualine.lua` - Statusline
  - `noice.lua` - Enhanced messages/cmdline UI
  - `colorscheme.lua` - tokyonight theme

- **keybindings.lua** - which-key.nvim for keybinding discovery

### Key Design Patterns

**Lazy Loading**: Most plugins use `event`, `cmd`, or `keys` to defer loading until needed.

**Capability Merging**: LSP servers get completion capabilities from blink.cmp via `require("blink.cmp").get_lsp_capabilities()`.

**Modern LSP API**: Uses `vim.lsp.config()` instead of the older `require('lspconfig')` pattern.

**Format on Save**: Controlled via conform.nvim with toggle commands. Respects buffer-local and global disable flags.

**Auto-linting**: Triggers on `BufEnter`, `BufWritePost`, and `InsertLeave` events.

## Modifying the Configuration

### Adding a New LSP Server

Edit `lua/plugins/lsp/lsp.lua`:

```lua
-- Add to ensure_installed list
ensure_installed = {
  "ts_ls",
  "rust_analyzer",  -- Add your server
},

-- Add to servers table
local servers = {
  ts_ls = {},
  rust_analyzer = {
    settings = {
      -- Server-specific settings
    },
  },
}
```

### Adding a New Formatter

Edit `lua/plugins/lsp/formatting.lua`:

```lua
formatters_by_ft = {
  javascript = { "prettier" },
  rust = { "rustfmt" },  -- Add your formatter
},
```

Then install the formatter: `:MasonInstall rustfmt`

### Adding a New Plugin

Create a file in the appropriate category folder (e.g., `lua/plugins/editor/my-plugin.lua`):

```lua
return {
  "author/plugin-name",
  event = "VeryLazy",  -- Lazy load strategy
  opts = {
    -- Plugin options
  },
}
```

Restart Neovim or run `:Lazy sync` to install.

### Changing Keybindings

For global keybindings, edit `lua/config/keymaps.lua`.

For plugin-specific keybindings, find the plugin's config file and modify the `keys` table or `config` function.

## Important Implementation Details

### Completion Engine

This config uses **blink.cmp** (not nvim-cmp). It's a modern, faster completion engine with built-in snippet support. Configuration is in `lua/plugins/lsp/completion.lua`.

### File Explorers

Two file explorers are configured:
- **oil.nvim** - Buffer-based editing (primary, mapped to `-`)
- **mini.files** - Column-based navigation (secondary, mapped to `<leader>fm`)

Choose based on preference or use case.

### Snacks.nvim Features

Snacks.nvim provides 15+ features. Key ones:
- **Dashboard** - Startup screen with custom ASCII art
- **Lazygit** - Git TUI integration (`<leader>gg`)
- **Terminal** - Floating terminal (`<C-/>`)
- **Zen Mode** - Distraction-free editing (`<leader>z`)
- **Bigfile** - Auto-disable features for large files
- **Notifier** - Fancy notifications

### Git Integration

- **gitsigns.nvim** - Inline git decorations, hunk operations
- **diffview.nvim** - Side-by-side diffs, 3-way merge conflict resolution, file history browser
  - `:DiffviewOpen` - Open diff view
  - `:DiffviewFileHistory` - View file history
  - Best for reviewing changes and resolving merge conflicts
- **snacks.lazygit** - Full lazygit TUI (`<leader>gg`)
- **snacks.gitbrowse** - Open current file in GitHub/GitLab (`<leader>gb`)

### Debugging (nvim-dap)

Complete DAP (Debug Adapter Protocol) integration for professional debugging:
- **Breakpoints** - Set/toggle with `<leader>db`, visual indicators in sign column
- **Step Debugging** - Step into/over/out with `<leader>di/do/dO`
- **Variable Inspection** - View variables in DAP UI sidebar
- **Virtual Text** - Inline variable values during debugging
- **REPL** - Interactive debugging console
- **Auto UI** - DAP UI automatically opens/closes with debug sessions
- **Mason Integration** - Install debuggers via `:MasonInstall python node2 js chrome firefox`

### Testing (neotest)

Unified test framework with real-time feedback:
- **Test Runners** - Supports Jest, Vitest, pytest, Go testing
- **Visual Indicators** - Test status shown in sign column (✓/✗/⟳)
- **Quick Run** - `<leader>tt` runs nearest test instantly
- **Watch Mode** - Auto-run tests on file save
- **Output Panel** - View test failures and errors
- **Summary Sidebar** - Tree view of all tests with status

### AI Assistance (GitHub Copilot)

GitHub Copilot integration for code generation and chat:
- **Inline Suggestions** - AI-powered autocompletions (`<M-l>` to accept)
- **Chat Interface** - Ask questions about code (`<leader>ai`)
- **Code Actions** - Generate tests, explain code, review suggestions (`<leader>ap`)
- **Context-Aware** - Uses surrounding code for better suggestions
- **Requires** - GitHub Copilot subscription (authenticate with `:Copilot setup`)

### Session Management (persistence.nvim)

Automatic session save/restore per directory:
- **Auto-Save** - Sessions saved on exit (in `~/.local/state/nvim/sessions/`)
- **Per-Project** - Separate sessions for each working directory
- **Manual Control** - `<leader>qs` restore, `<leader>qd` don't save
- **Selective** - Only saves buffers, windows, tabs (not global state)

### Refactoring (refactoring.nvim)

Advanced code refactoring operations:
- **Extract Function** - `<leader>re` (visual mode)
- **Extract Variable** - `<leader>rv` (visual mode)
- **Inline Variable/Function** - `<leader>ri/rI`
- **Telescope Integration** - `<leader>rr` shows all available refactorings
- **Language Support** - TypeScript, JavaScript, Python, Go, Lua, Ruby, PHP, Java, C++

### TODO Comments (todo-comments.nvim)

Highlighted TODO/FIXME/HACK tracking:
- **Keywords** - TODO, FIXME, HACK, WARN, PERF, NOTE, TEST
- **Colorful Highlights** - Different colors for different keyword types
- **Navigation** - `]t`/`[t` to jump between todos
- **Search** - `:TodoTelescope` or `<leader>st` to search all todos
- **Trouble Integration** - `:TodoTrouble` or `<leader>xt`

### REST Client (kulala.nvim)

Test APIs directly in Neovim with .http files:
- **HTTP Files** - Create `.http` files with requests
- **Quick Run** - `<leader>kr` to execute request
- **Response Viewer** - View formatted JSON, XML, HTML responses
- **Variables** - Support for environment variables and dynamic values
- **Copy as cURL** - `<leader>kc` exports request as curl command
- **Example .http file**:
  ```http
  POST https://api.example.com/users
  Content-Type: application/json

  {
    "name": "John Doe"
  }
  ```

### Markdown Preview (peek.nvim)

Live Markdown preview with GitHub styling:
- **Live Preview** - Real-time updates as you type
- **GitHub Style** - Matches GitHub's markdown rendering
- **Dark/Light Theme** - Automatically matches your theme
- **Toggle** - `<leader>mp` to open/close preview
- **Requires** - Deno runtime (`brew install deno`)
- **Preview Location** - Opens in default browser or webview

### Smart Splits (smart-splits.nvim)

Seamless navigation between Neovim and tmux:
- **Unified Navigation** - Same keys work in Neovim and tmux
- **Arrow Resize** - `<C-Arrow>` to resize splits intuitively
- **Alt Navigation** - `<A-hjkl>` to move between splits
- **Buffer Swapping** - `<leader><leader>hjkl` to swap buffer positions
- **Tmux Integration** - Automatically detects and navigates into tmux panes

### TypeScript Enhanced (typescript-tools.nvim)

Superior TypeScript/JavaScript experience:
- **Faster** - More performant than base ts_ls
- **Inlay Hints** - Shows parameter names and return types inline
- **Organize Imports** - Auto-organize and remove unused imports
- **Rename File** - Update all imports when renaming files
- **Code Actions** - Fix all, add missing imports, remove unused

### Line Endings

This config enforces Unix line endings (LF) via:
1. `.gitattributes` with `* text=auto eol=lf`
2. Autocommand in `init.lua` for new `.lua` files

Always use LF endings to avoid massive diffs.

## Troubleshooting

### Plugins Not Loading

1. Check lazy.nvim status: `:Lazy`
2. Sync plugins: `:Lazy sync`
3. Check for errors: `:messages`
4. Profile startup: `:Lazy profile`

### LSP Not Working

1. Verify server installed: `:Mason`
2. Check LSP status: `:LspInfo`
3. View logs: `:LspLog`
4. Restart server: `:LspRestart`

### Formatting Not Working

1. Check formatter installed: `:ConformInfo`
2. Install via Mason: `:MasonInstall prettier`
3. Check format disabled: Look for `disable_autoformat` flags
4. Enable formatting: `:FormatEnable`

### Tree-sitter Errors

1. Update parsers: `:TSUpdate`
2. Install specific parser: `:TSInstall <language>`
3. Check health: `:checkhealth nvim-treesitter`

### Completion Not Working

1. Verify blink.cmp loaded: Check `:Lazy` for "blink.cmp"
2. Check LSP running: `:LspInfo`
3. Ensure in insert mode (completion triggers on InsertEnter)

### Debugging Not Working

1. Check DAP status: `:lua require('dap').status()`
2. Verify debugger installed: `:Mason` (look for python, node2, js, etc.)
3. Check DAP configuration: `:lua =require('dap').configurations`
4. View DAP logs: `:DapShowLog`
5. Ensure in correct filetype (adapters are filetype-specific)

### Tests Not Running

1. Check neotest status: `:Neotest summary`
2. Verify test adapter for your language is installed (check `lua/plugins/testing/neotest.lua`)
3. Ensure test framework installed: `npm install jest` or `pip install pytest`
4. Check test file naming (must match adapter patterns: `*.test.js`, `test_*.py`, etc.)
5. View output: `:Neotest output`

### Copilot Not Working

1. Authenticate: `:Copilot setup`
2. Check status: `:Copilot status`
3. Verify subscription: Requires active GitHub Copilot subscription
4. Check in insert mode: Suggestions only appear during editing
5. Restart: `:Copilot restart`

### Markdown Preview Not Opening

1. Verify Deno installed: Run `deno --version` in terminal
2. Check peek.nvim loaded: `:Lazy` → find "peek.nvim"
3. Rebuild plugin: `:Lazy build peek.nvim`
4. Check file type: Only works in `.md` files
5. View errors: `:messages`

### Diffview/Git Diff Not Working

1. Ensure in git repository: `git status`
2. Check for changes: `git diff` in terminal
3. Try: `:DiffviewOpen HEAD~1` to compare with last commit
4. For merge conflicts: `:DiffviewOpen` automatically shows 3-way diff
5. Close: `:DiffviewClose`

## Development Workflow

### Editing Config

```bash
# Option 1: Edit via symlink
cd ~/.config/nvim
nvim lua/plugins/lsp/lsp.lua

# Option 2: Edit directly in git repo
cd ~/projects/nvim-config
nvim lua/plugins/lsp/lsp.lua

# Both point to the same files due to symlink
```

### Testing Changes

```bash
# Reload config (restart Neovim)
nvim

# Or use a command to reload
:source $MYVIMRC

# Check for errors
:checkhealth
:messages
```

### Committing Changes

```bash
cd ~/projects/nvim-config
git status
git add .
git commit -m "feat: Add rust-analyzer LSP support"
git push
```

Or use the shell function:
```bash
nvimbackup  # Alias for backup-nvim()
```

## Common Patterns When Adding Features

### Adding Language Support

1. Install LSP server: `:MasonInstall <server>`
2. Add to `lua/plugins/lsp/lsp.lua`
3. Install Tree-sitter parser: `:TSInstall <lang>`
4. Add formatter to `lua/plugins/lsp/formatting.lua`
5. Add linter to `lua/plugins/lsp/formatting.lua`

### Adding New Keybinding Group

Use which-key in plugin config:

```lua
keys = {
  { "<leader>t", group = "Test" },
  { "<leader>tr", "<cmd>TestNearest<cr>", desc = "Run nearest test" },
  { "<leader>tf", "<cmd>TestFile<cr>", desc = "Run test file" },
},
```

### Performance Optimization

- Use `event` for lazy loading
- Use `cmd` for command-based plugins
- Use `keys` for keybinding-triggered plugins
- Disable features for large files (handled by snacks.bigfile)

## Important Files

- **lazy-lock.json** - Pinned plugin versions (commit this)
- **.gitignore** - Excludes lazy.nvim data directory
- **.gitattributes** - Enforces LF line endings
- **init.lua** - Entry point (minimal, delegates to config/)
- **lua/config/** - Core Neovim settings
- **lua/plugins/** - All plugin specifications

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

## Debuggers (via Mason)

Install debuggers for your languages via `:Mason`:

```vim
:MasonInstall python     " Python debugger (debugpy)
:MasonInstall node2      " Node.js debugger
:MasonInstall js         " JavaScript debugger
:MasonInstall chrome     " Chrome DevTools debugger
:MasonInstall firefox    " Firefox debugger
:MasonInstall go         " Go debugger (delve)
```

## File Naming Conventions

- Plugin configs: Use descriptive names matching the plugin's purpose
- Multi-plugin files: Group by category (e.g., `editor.lua` for multiple editing plugins)
- Nested directories: Organize by function (lsp/, ui/, editor/, etc.)

## When Updating Plugins

1. Check breaking changes: `:Lazy log`
2. Update: `:Lazy update`
3. Test config: `:checkhealth`
4. Commit lock file: `git add lazy-lock.json && git commit -m "chore: Update plugins"`

## Major Updates

### October 2025: Professional Development Tools Expansion

Added 11 enterprise-grade plugins after comprehensive research of 2024-2025 Neovim ecosystem:

**New Plugin Categories:**
- `ai/` - GitHub Copilot integration (copilot.lua + CopilotChat.nvim)
- `debug/` - Full DAP debugging suite (nvim-dap + UI + virtual text)
- `testing/` - Unified test runner (neotest with Jest/Vitest/Python/Go adapters)
- `session/` - Automatic session management (persistence.nvim)
- `tools/` - REST client and Markdown preview (kulala.nvim + peek.nvim)

**Enhanced Existing Categories:**
- `coding/` - Added todo-comments, refactoring.nvim, peek.nvim
- `git/` - Added diffview.nvim for superior diff viewing
- `lsp/` - Added typescript-tools.nvim for enhanced TS/JS experience
- `editor/` - Added smart-splits.nvim for tmux integration

**Why These Plugins:**
1. **Active Maintenance** - All actively maintained in 2024-2025
2. **Community Validated** - 1000+ stars or significant buzz
3. **Best-in-Class** - Industry-leading in their categories
4. **Non-Redundant** - Fill gaps without duplication
5. **Modern APIs** - Use Neovim 0.10+ features

**Architectural Changes:**
- Upgraded from nvim-cmp to blink.cmp (better performance)
- Reorganized from 7 to 12 plugin categories
- All new plugins use lazy loading for optimal startup time
- Comprehensive keybinding documentation for discoverability

**Impact:**
- Professional debugging capabilities (breakpoints, variable inspection, step-through)
- Integrated testing with real-time feedback
- AI-assisted coding with GitHub Copilot
- Advanced refactoring operations
- Complete git workflow (hunks → diffs → merge conflicts)
- API testing without leaving editor
- Live markdown preview with GitHub styling
- Seamless tmux integration

For full details, see README.md Phase 5 documentation.

## Resources

- [Lazy.nvim Docs](https://github.com/folke/lazy.nvim)
- [Mason Registry](https://mason-registry.dev/)
- [Neovim Lua Guide](https://neovim.io/doc/user/lua-guide.html)
- [Config on GitHub](https://github.com/jaded423/nvim-config)
- [nvim-dap Docs](https://github.com/mfussenegger/nvim-dap)
- [neotest Docs](https://github.com/nvim-neotest/neotest)
- [GitHub Copilot](https://github.com/features/copilot)
