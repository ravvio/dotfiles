return {
   "neovim/nvim-lspconfig",
   dependencies = {
       "williamboman/mason.nvim",
       "williamboman/mason-lspconfig.nvim"
    },
    config = function()
        -- Set up lspconfig.
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        local lspconfig = require("lspconfig")
        lspconfig.tsserver.setup { capabilities = capabilities }
        lspconfig.rust_analyzer.setup { capabilities = capabilities }
        lspconfig.lua_ls.setup { capabilities = capabilities }
        lspconfig.pyright.setup { capabilities = capabilities }
        lspconfig.html.setup { capabilities = capabilities }
        lspconfig.jsonls.setup { capabilities = capabilities }
    end,
}
