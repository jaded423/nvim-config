# 🐍 Jaded's Neovim Configuration

> **Strike fast. Code faster!**

A modern, feature-rich Neovim configuration built with Lua, optimized for web development, Python, and database work. This config was modernized and enhanced with AI assistance to follow 2024-2025 best practices.

![Neovim](https://img.shields.io/badge/NeoVim-%2357A143.svg?&style=for-the-badge&logo=neovim&logoColor=white)
![Lua](https://img.shields.io/badge/lua-%232C2D72.svg?style=for-the-badge&logo=lua&logoColor=white)

---

## ✨ Features

- 🎨 **Modern UI**: Beautiful dashboard with snacks.nvim, lualine statusline, and tokyonight theme
- 🌳 **Tree-sitter**: Superior syntax highlighting and code understanding
- 🔍 **Fuzzy Finding**: Telescope for files, text, and buffers
- 🗂️ **Dual File Explorers**: oil.nvim (buffer-based) and mini.files (column view)
- 📝 **LSP Integration**: Full language server support via mason.nvim
- 🤖 **Auto-completion**: nvim-cmp with snippets
- 🎯 **Code Navigation**: Trouble for diagnostics, Aerial for symbols
- 🔧 **Formatting & Linting**: conform.nvim + nvim-lint with auto-format on save
- 🌿 **Git Integration**: Gitsigns for hunks, lazygit for TUI, gitbrowse for GitHub/GitLab
- ⚡ **Performance**: Bigfile handling, optimized lazy loading
- 🎭 **Focus Mode**: Zen mode with dimming for distraction-free coding
- 🗄️ **Database UI**: Built-in database explorer
- 🎹 **Keybinding Helper**: which-key for discoverability

---

## 📦 Plugin List

### **Core**

- [lazy.nvim](https://github.com/folke/lazy.nvim) - Modern plugin manager
- [plenary.nvim](https://github.com/nvim-lua/plenary.nvim) - Lua utilities

### **LSP & Completion**

- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - LSP client configuration
- [mason.nvim](https://github.com/williamboman/mason.nvim) - Package manager for LSP/DAP/linters
- [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim) - Bridge between mason and lspconfig
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - Completion engine
- [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp) - LSP completion source
- [cmp-buffer](https://github.com/hrsh7th/cmp-buffer) - Buffer completion source
- [cmp-path](https://github.com/hrsh7th/cmp-path) - Path completion source
- [LuaSnip](https://github.com/L3MON4D3/LuaSnip) - Snippet engine
- [friendly-snippets](https://github.com/rafamadriz/friendly-snippets) - Snippet collection

### **Syntax & Highlighting**

- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - Tree-sitter integration
- [nvim-treesitter-textobjects](https://github.com/nvim-treesitter/nvim-treesitter-textobjects) - Textobject definitions

### **File Navigation**

- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) - Fuzzy finder
- [oil.nvim](https://github.com/stevearc/oil.nvim) - Edit filesystem like a buffer
- [mini.files](https://github.com/echasnovski/mini.files) - Column-based file manager

### **Git**

- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) - Git decorations and hunk operations
- [snacks.nvim (lazygit)](https://github.com/folke/snacks.nvim) - Lazygit integration
- [snacks.nvim (gitbrowse)](https://github.com/folke/snacks.nvim) - Open files in GitHub/GitLab

### **Code Quality**

- [conform.nvim](https://github.com/stevearc/conform.nvim) - Code formatting
- [nvim-lint](https://github.com/mfussenegger/nvim-lint) - Asynchronous linting

### **Code Navigation & Diagnostics**

- [trouble.nvim](https://github.com/folke/trouble.nvim) - Beautiful diagnostics list
- [aerial.nvim](https://github.com/stevearc/aerial.nvim) - Code outline sidebar

### **Editing**

- [nvim-autopairs](https://github.com/windwp/nvim-autopairs) - Auto-close brackets
- [Comment.nvim](https://github.com/numToStr/Comment.nvim) - Smart commenting
- [mini.surround](https://github.com/echasnovski/mini.surround) - Surround operations
- [mini.ai](https://github.com/echasnovski/mini.ai) - Extended textobjects

### **UI & UX**

- [noice.nvim](https://github.com/folke/noice.nvim) - Enhanced UI for messages/cmdline
- [snacks.nvim](https://github.com/folke/snacks.nvim) - Collection of QoL features
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) - Statusline
- [tokyonight.nvim](https://github.com/folke/tokyonight.nvim) - Colorscheme
- [which-key.nvim](https://github.com/folke/which-key.nvim) - Keybinding popup

### **Utilities**

- [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim) - Terminal integration
- [mini.jump2d](https://github.com/echasnovski/mini.jump2d) - Quick navigation
- [mini.bracketed](https://github.com/echasnovski/mini.bracketed) - Navigate with brackets
- [mini.hipatterns](https://github.com/echasnovski/mini.hipatterns) - Highlight color codes
- [mini.trailspace](https://github.com/echasnovski/mini.trailspace) - Whitespace management

### **Database**

- [vim-dadbod](https://github.com/tpope/vim-dadbod) - Database interface
- [vim-dadbod-ui](https://github.com/kristijanhusak/vim-dadbod-ui) - Database UI
- [vim-dadbod-completion](https://github.com/kristijanhusak/vim-dadbod-completion) - SQL completion

---

## 🚀 Installation

### Prerequisites

- Neovim >= 0.9.4 (0.10+ recommended)
- Git
- A [Nerd Font](https://www.nerdfonts.com/) (optional but recommended)
- ripgrep (for Telescope grep)
- Node.js (for some LSP servers)

### Install

```bash
# Backup existing config
mv ~/.config/nvim ~/.config/nvim.backup

# Clone this config
git clone https://github.com/jaded423/nvim-config.git ~/.config/nvim

# Start Neovim - plugins will auto-install
nvim
```

### Post-Install

1. **Install Language Servers**

   ```vim
   :Mason
   ```

   Install servers for your languages (ts_ls, eslint, pyright, etc.)

2. **Install Formatters/Linters**
   Via Mason or your package manager:
   - `prettier` - JS/TS/JSON/CSS/Markdown
   - `stylua` - Lua
   - `black` + `isort` - Python
   - `eslint_d` - JS/TS linting
   - `pylint` - Python linting

3. **Install Lazygit** (optional but recommended)
   ```bash
   brew install lazygit  # macOS
   # or see https://github.com/jesseduffield/lazygit
   ```

---

## ⌨️ Keybindings

Leader key: `<Space>`

### General

| Key         | Action                           |
| ----------- | -------------------------------- |
| `<leader>?` | Show all keybindings (which-key) |
| `<leader>w` | Save file                        |
| `<leader>q` | Quit                             |

### File Navigation

| Key                         | Action                             |
| --------------------------- | ---------------------------------- |
| `<leader>ff`                | Find files                         |
| `<leader>fg`                | Live grep (search text)            |
| `<leader>fb`                | Find buffers                       |
| `<leader>fo`                | Recent files                       |
| `-`                         | Open oil.nvim (parent directory)   |
| `<leader>-`                 | Open oil.nvim (floating)           |
| `<leader>fm`                | Open mini.files (current file dir) |
| `<leader>fM`                | Open mini.files (cwd)              |
| `<leader>fj` / `<leader>jf` | Built-in file explorer             |

### Buffer Management

| Key          | Action          |
| ------------ | --------------- |
| `<leader>bn` | Next buffer     |
| `<leader>bp` | Previous buffer |
| `<leader>bd` | Delete buffer   |

### Window Navigation

| Key     | Action                |
| ------- | --------------------- |
| `<C-h>` | Move to left window   |
| `<C-l>` | Move to right window  |
| `<C-j>` | Move to bottom window |
| `<C-k>` | Move to top window    |

### Git

| Key          | Action                      |
| ------------ | --------------------------- |
| `]c` / `[c`  | Next/previous hunk          |
| `<leader>hs` | Stage hunk                  |
| `<leader>hr` | Reset hunk                  |
| `<leader>hp` | Preview hunk                |
| `<leader>hb` | Blame line                  |
| `<leader>tb` | Toggle line blame           |
| `<leader>gg` | Open lazygit                |
| `<leader>gb` | Git browse (open in GitHub) |
| `<leader>gB` | Git blame line (inline)     |

### LSP

| Key          | Action              |
| ------------ | ------------------- |
| `gd`         | Go to definition    |
| `gr`         | Go to references    |
| `K`          | Hover documentation |
| `<leader>rn` | Rename              |
| `<leader>ca` | Code action         |
| `<leader>cf` | Format buffer       |
| `<leader>cl` | Trigger linting     |

### Diagnostics & Navigation

| Key          | Action                                    |
| ------------ | ----------------------------------------- |
| `<leader>xx` | Toggle diagnostics (Trouble)              |
| `<leader>xX` | Buffer diagnostics (Trouble)              |
| `<leader>a`  | Toggle aerial (symbols)                   |
| `[a` / `]a`  | Previous/next symbol                      |
| `[d` / `]d`  | Previous/next diagnostic (mini.bracketed) |
| `[b` / `]b`  | Previous/next buffer (mini.bracketed)     |

### Editing

| Key                | Action                              |
| ------------------ | ----------------------------------- |
| `gcc`              | Toggle comment (line)               |
| `gc` (visual)      | Toggle comment (selection)          |
| `sa{motion}`       | Add surrounding                     |
| `sd{char}`         | Delete surrounding                  |
| `sr{old}{new}`     | Replace surrounding                 |
| `<` / `>` (visual) | Indent left/right (keeps selection) |

### Utilities

| Key         | Action                       |
| ----------- | ---------------------------- |
| `<C-\>`     | Toggle terminal (toggleterm) |
| `<C-/>`     | Toggle terminal (snacks)     |
| `<leader>z` | Toggle zen mode              |
| `<leader>Z` | Toggle zoom                  |
| `<leader>.` | Toggle scratch buffer        |
| `<leader>N` | Notification history         |
| `<CR>`      | Start jump2d navigation      |

### Database

| Key          | Action               |
| ------------ | -------------------- |
| `<leader>db` | Open Database UI     |
| `<leader>dt` | Toggle Database UI   |
| `<leader>df` | Find Database Buffer |

---

## 📁 Structure

```
~/.config/nvim/
├── init.lua                    # Entry point
├── lazy-lock.json             # Plugin versions (auto-generated)
└── lua/
    ├── config/
    │   ├── options.lua        # Vim options
    │   ├── keymaps.lua        # Keybindings
    │   ├── autocmds.lua       # Autocommands
    │   └── lazy.lua           # Plugin manager setup
    └── plugins/
        ├── colorscheme.lua    # Theme configuration
        ├── lsp.lua            # LSP setup
        ├── completion.lua     # nvim-cmp configuration
        ├── syntax.lua         # Tree-sitter setup
        ├── telescope.lua      # Fuzzy finder
        ├── git.lua            # Git integrations (gitsigns)
        ├── editor.lua         # Editor plugins (autopairs, comment, oil)
        ├── ui.lua             # UI plugins (noice, snacks, lualine)
        ├── formatting.lua     # conform.nvim + nvim-lint
        ├── navigation.lua     # trouble.nvim + aerial.nvim
        ├── keybindings.lua    # which-key configuration
        ├── mini.lua           # mini.nvim modules
        └── database.lua       # Database UI setup
```

---

## 🎨 Customization

### Change Colorscheme

Edit `lua/plugins/colorscheme.lua`:

```lua
return {
  "folke/tokyonight.nvim",
  config = function()
    require("tokyonight").setup({
      style = "night", -- or "storm", "moon", "day"
    })
    vim.cmd.colorscheme("tokyonight-night")
  end,
}
```

### Disable Format on Save

```vim
:FormatDisable        " Disable for current buffer
:FormatDisable!       " Disable globally
:FormatEnable         " Re-enable
```

### Add More LSP Servers

Edit `lua/plugins/lsp.lua` and add to `ensure_installed`:

```lua
ensure_installed = {
  "ts_ls",
  "rust_analyzer",  -- Add your server
},
```

### Toggle Features

Many features can be toggled via snacks.nvim's toggle system or which-key.

---

## 🤖 AI-Assisted Modernization

This configuration was comprehensively upgraded by Claude (Anthropic's AI assistant) on October 1, 2024. The modernization process included:

### Phase 1: Critical Updates

- ✅ Replaced `vim-polyglot` with modern `nvim-treesitter`
- ✅ Fixed duplicate keybindings and lazy loading conflicts
- ✅ Added `gitsigns.nvim` for essential git integration
- ✅ Integrated `oil.nvim` for vim-native file exploration

### Phase 2: Enhanced Development Tools

- ✅ Added `conform.nvim` for code formatting (replacing null-ls)
- ✅ Added `nvim-lint` for asynchronous linting
- ✅ Integrated `trouble.nvim` for beautiful diagnostics
- ✅ Added `aerial.nvim` for code outline/symbols
- ✅ Implemented `which-key.nvim` for keybinding discoverability

### Phase 3: Snacks.nvim Feature Expansion

Expanded from 5 to 15+ snacks.nvim features:

- ✅ Performance: `bigfile`, `bufdelete`, `quickfile`
- ✅ Visual: `indent`, `scroll`, `animate`, `statuscolumn`, `dim`, `zen`
- ✅ Git: `lazygit`, `gitbrowse`
- ✅ Utilities: `terminal`, `toggle`, `scope`, `scratch`

### Phase 4: Mini.nvim Ecosystem

- ✅ Added `mini.surround` for surrounding operations
- ✅ Added `mini.ai` for powerful textobjects
- ✅ Added `mini.files` as alternative file manager
- ✅ Added `mini.jump2d` for quick navigation
- ✅ Added `mini.bracketed` for bracket-based navigation
- ✅ Added `mini.hipatterns` for color highlighting
- ✅ Added `mini.trailspace` for whitespace management

### Methodology

The AI assistant:

1. Analyzed the existing configuration structure
2. Researched current Neovim best practices (2024-2025)
3. Identified gaps and deprecated patterns
4. Implemented changes in 4 tested phases
5. Verified functionality after each phase
6. Maintained the original config structure and organization

All changes follow modern Neovim conventions and are fully tested.

---

## 🐛 Troubleshooting

### Plugins not installing?

```vim
:Lazy sync
```

### LSP not working?

1. Check server is installed: `:Mason`
2. Check LSP status: `:LspInfo`
3. Restart LSP: `:LspRestart`

### Tree-sitter errors?

```vim
:TSUpdate
```

### Format not working?

Ensure formatters are installed:

```vim
:ConformInfo
```

---

## 📝 License

MIT License - See LICENSE file for details

---

## 🙏 Credits

- Configuration maintained by [@jaded423](https://github.com/jaded423)
- Modernized with assistance from Claude (Anthropic)
- Built on the excellent Neovim plugin ecosystem

---

## 🔗 Resources

- [Neovim Documentation](https://neovim.io/doc/)
- [lazy.nvim](https://github.com/folke/lazy.nvim)
- [Mason Registry](https://mason-registry.dev/)
- [Awesome Neovim](https://github.com/rockerBOO/awesome-neovim)

---

**Enjoy your modern Neovim setup!** 🚀

# testing nvimbackup funchtion
