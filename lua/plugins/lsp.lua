return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
  },
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("mason").setup({
      ui = {
        border = "rounded",
      }
    })
    
    require("mason-lspconfig").setup({
      ensure_installed = { 
        "ts_ls",  -- Updated from tsserver
        "eslint", 
        "jsonls",
        "html",
        "cssls",
        "pyright",
      },
    })

    local lspconfig = require("lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- Configure servers
    local servers = {
      ts_ls = {},  -- Updated from tsserver
      eslint = {},
      jsonls = {},
      html = {},
      cssls = {},
      pyright = {},
    }

    for server, config in pairs(servers) do
      config.capabilities = capabilities
      lspconfig[server].setup(config)
    end
  end,
}
