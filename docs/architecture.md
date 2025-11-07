# Architecture

## Initialization Flow

1. **init.lua** - Entry point that sets leader key and loads core modules
2. **lua/config/options.lua** - Vim options (UI, search, indentation)
3. **lua/config/keymaps.lua** - Global keybindings
4. **lua/config/autocmds.lua** - Autocommands and event handlers
5. **lua/config/lazy.lua** - Bootstraps lazy.nvim and imports plugin specs

## Plugin Organization

Plugins are organized by category in `lua/plugins/`:

- **ai/** - AI assistance (NEW)
  - `copilot.lua` - GitHub Copilot + CopilotChat for code generation and explanations
  - `avante.lua` - Next-gen AI assistant

- **coding/** - Language-specific features
  - `syntax.lua` - Tree-sitter configuration
  - `render-markdown.lua` - Markdown rendering
  - `todo-comments.lua` - Highlight and search TODO/FIXME/HACK comments (NEW)
  - `refactoring.nvim` - Advanced refactoring operations (extract, inline, etc.) (NEW)
  - `peek.lua` - Live Markdown preview with GitHub-style rendering (NEW)

- **debug/** - Debugging tools (NEW)
  - `nvim-dap.lua` - Complete DAP debugging suite (dap, dap-ui, virtual-text, mason-dap)
  - `perfanno.lua` - Performance profiling

- **editor/** - Editing utilities
  - `editor.lua` - Autopairs, comments, oil.nvim file explorer
  - `mini.lua` - Collection of mini.nvim modules (surround, ai textobjects, files, jump2d, etc.)
  - `smart-splits.lua` - Smart split navigation and resizing (tmux-aware) (NEW)

- **git/** - Git integration
  - `git.lua` - gitsigns.nvim for hunks and inline blame
  - `diffview.lua` - Superior diff viewer with 3-way merge conflict resolution (NEW)
  - `neogit.lua` - Magit-like Git interface
  - `lazygit.nvim` - LazyGit TUI integration

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
  - `dadbod-ui.lua` - UI for vim-dadbod
  - `obsidian.lua` - Obsidian vault integration

- **ui/** - User interface enhancements
  - `snacks.lua` - Multi-feature plugin (dashboard, notifications, terminal, zen mode)
  - `lualine.lua` - Statusline
  - `noice.lua` - Enhanced messages/cmdline UI
  - `colorscheme.lua` - tokyonight theme

- **keybindings.lua** - which-key.nvim for keybinding discovery

## Key Design Patterns

**Lazy Loading**: Most plugins use `event`, `cmd`, or `keys` to defer loading until needed.

**Capability Merging**: LSP servers get completion capabilities from blink.cmp via `require("blink.cmp").get_lsp_capabilities()`.

**Modern LSP API**: Uses `vim.lsp.config()` instead of the older `require('lspconfig')` pattern.

**Format on Save**: Controlled via conform.nvim with toggle commands. Respects buffer-local and global disable flags.

**Auto-linting**: Triggers on `BufEnter`, `BufWritePost`, and `InsertLeave` events.

## Implementation Details

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
