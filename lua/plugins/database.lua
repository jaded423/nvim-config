return {
  {
    "tpope/vim-dadbod",
    priority = 50,
    dependencies = {
      "kristijanhusak/vim-dadbod-ui",
      "kristijanhusak/vim-dadbod-completion",
    },
    lazy = false,
    cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer" },
    config = function()
      -- Database UI settings
      vim.g.db_ui_use_nerd_fonts = 1
      vim.g.db_ui_winwidth = 30
      vim.g.db_ui_auto_execute_table_helpers = 1
      
      -- Enable completion in sql files
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "sql", "mysql", "plsql" },
        callback = function()
          require("cmp").setup.buffer({ sources = {{ name = "vim-dadbod-completion" }} })
        end,
      })
    end,
  },
}
