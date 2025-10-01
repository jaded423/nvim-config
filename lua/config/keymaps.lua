-- All key mappings

local keymap = vim.keymap.set

-- Clear search highlighting
keymap("n", "^<Esc^>", "^<cmd^>nohlsearch^<CR^>")

-- File explorer
keymap('n', '<leader>fj', ':Ex<CR>', { desc = "Open built-in file explorer" })
keymap('n', '<leader>jf', ':Ex<CR>', { desc = "Open built-in file explorer" })

-- Save and quit shortcuts
keymap("n", "<leader>w", "<cmd>write<CR>", { desc = "Save file" })
keymap("n", "<leader>q", "<cmd>quit<CR>", { desc = "Quit" })

-- Telescope fuzzy finder
keymap("n", "^<leader^>ff", "^<cmd^>Telescope find_files^<CR^>", { desc = "Find files" })
keymap("n", "^<leader^>fg", "^<cmd^>Telescope live_grep^<CR^>", { desc = "Live grep" })
keymap("n", "^<leader^>fb", "^<cmd^>Telescope buffers^<CR^>", { desc = "Find buffers" })
keymap("n", "^<leader^>fo", "^<cmd^>Telescope oldfiles^<CR^>", { desc = "Recent files" })

-- Database UI keymaps
keymap("n", "^<leader^>db", "^<cmd^>DBUI^<CR^>", { desc = "Open Database UI" })
keymap("n", "^<leader^>dt", "^<cmd^>DBUIToggle^<CR^>", { desc = "Toggle Database UI" })
keymap("n", "^<leader^>df", "^<cmd^>DBUIFindBuffer^<CR^>", { desc = "Find Database Buffer" })
keymap("n", "^<leader^>dr", "^<cmd^>DBUIRenameBuffer^<CR^>", { desc = "Rename Database Buffer" })
keymap("n", "^<leader^>dl", "^<cmd^>DBUILastQueryInfo^<CR^>", { desc = "Last Query Info" })

-- LSP keymaps
keymap("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
keymap("n", "gr", vim.lsp.buf.references, { desc = "Go to references" })
keymap("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation" })
keymap("n", "^<leader^>rn", vim.lsp.buf.rename, { desc = "Rename" })
keymap("n", "^<leader^>ca", vim.lsp.buf.code_action, { desc = "Code action" })

-- Buffer navigation
keymap("n", "^<leader^>bn", "^<cmd^>bnext^<CR^>", { desc = "Next buffer" })
keymap("n", "^<leader^>bp", "^<cmd^>bprev^<CR^>", { desc = "Previous buffer" })
keymap("n", "^<leader^>bd", "^<cmd^>bdelete^<CR^>", { desc = "Delete buffer" })

-- Window navigation
keymap("n", "^<C-h^>", "^<C-w^>h", { desc = "Move to left window" })
keymap("n", "^<C-l^>", "^<C-w^>l", { desc = "Move to right window" })
keymap("n", "^<C-j^>", "^<C-w^>j", { desc = "Move to bottom window" })
keymap("n", "^<C-k^>", "^<C-w^>k", { desc = "Move to top window" })

-- Better indenting
keymap("v", "^<", "^<gv")
keymap("v", "^>", "^>gv")

-- Snacks keybindings
keymap("n", "<leader>gb", function() Snacks.gitbrowse() end, { desc = "Git Browse" })
keymap("n", "<leader>gg", function() Snacks.lazygit() end, { desc = "Lazygit" })
keymap("n", "<leader>gB", function() Snacks.git.blame_line() end, { desc = "Git Blame Line" })
keymap("n", "<leader>z", function() Snacks.zen() end, { desc = "Toggle Zen Mode" })
keymap("n", "<leader>Z", function() Snacks.zen.zoom() end, { desc = "Toggle Zoom" })
keymap("n", "<leader>.", function() Snacks.scratch() end, { desc = "Toggle Scratch Buffer" })
keymap("n", "<leader>S", function() Snacks.scratch.select() end, { desc = "Select Scratch Buffer" })
keymap("n", "<c-/>", function() Snacks.terminal() end, { desc = "Toggle Terminal" })
keymap("n", "<leader>bd", function() Snacks.bufdelete() end, { desc = "Delete Buffer (snacks)" })
keymap("n", "<leader>N", function() Snacks.notifier.show_history() end, { desc = "Notification History" })
