-- All autocommands and automation

-- Enable word wrapping for markdown files only
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
    vim.opt_local.list = false
  end,
  desc = "Enable word wrapping for markdown files"
})

-- Highlight when yanking text
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  desc = "Highlight when yanking text"
})
