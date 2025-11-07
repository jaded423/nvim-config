# Commands Reference

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
