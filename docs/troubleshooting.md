# Troubleshooting

## Plugins Not Loading

1. Check lazy.nvim status: `:Lazy`
2. Sync plugins: `:Lazy sync`
3. Check for errors: `:messages`
4. Profile startup: `:Lazy profile`

## LSP Not Working

1. Verify server installed: `:Mason`
2. Check LSP status: `:LspInfo`
3. View logs: `:LspLog`
4. Restart server: `:LspRestart`

## Formatting Not Working

1. Check formatter installed: `:ConformInfo`
2. Install via Mason: `:MasonInstall prettier`
3. Check format disabled: Look for `disable_autoformat` flags
4. Enable formatting: `:FormatEnable`

## Tree-sitter Errors

1. Update parsers: `:TSUpdate`
2. Install specific parser: `:TSInstall <language>`
3. Check health: `:checkhealth nvim-treesitter`

## Completion Not Working

1. Verify blink.cmp loaded: Check `:Lazy` for "blink.cmp"
2. Check LSP running: `:LspInfo`
3. Ensure in insert mode (completion triggers on InsertEnter)

## Debugging Not Working

1. Check DAP status: `:lua require('dap').status()`
2. Verify debugger installed: `:Mason` (look for python, node2, js, etc.)
3. Check DAP configuration: `:lua =require('dap').configurations`
4. View DAP logs: `:DapShowLog`
5. Ensure in correct filetype (adapters are filetype-specific)

## Tests Not Running

1. Check neotest status: `:Neotest summary`
2. Verify test adapter for your language is installed (check `lua/plugins/testing/neotest.lua`)
3. Ensure test framework installed: `npm install jest` or `pip install pytest`
4. Check test file naming (must match adapter patterns: `*.test.js`, `test_*.py`, etc.)
5. View output: `:Neotest output`

## Copilot Not Working

1. Authenticate: `:Copilot setup`
2. Check status: `:Copilot status`
3. Verify subscription: Requires active GitHub Copilot subscription
4. Check in insert mode: Suggestions only appear during editing
5. Restart: `:Copilot restart`

## Markdown Preview Not Opening

1. Verify Deno installed: Run `deno --version` in terminal
2. Check peek.nvim loaded: `:Lazy` → find "peek.nvim"
3. Rebuild plugin: `:Lazy build peek.nvim`
4. Check file type: Only works in `.md` files
5. View errors: `:messages`

## Diffview/Git Diff Not Working

1. Ensure in git repository: `git status`
2. Check for changes: `git diff` in terminal
3. Try: `:DiffviewOpen HEAD~1` to compare with last commit
4. For merge conflicts: `:DiffviewOpen` automatically shows 3-way diff
5. Close: `:DiffviewClose`
