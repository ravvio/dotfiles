return {
   "neovim/nvim-lspconfig",
   dependencies = {
       "williamboman/mason.nvim",
       "williamboman/mason-lspconfig.nvim"
    },
    config = function()
        local lspconfig = require("lspconfig")
        lspconfig.tsserver.setup {}
        lspconfig.rust_analyzer.setup {}
        lspconfig.lua_ls.setup {}
        lspconfig.pyright.setup {}
        lspconfig.html.setup {}
        lspconfig.jsonls.setup {}
    end,
}
