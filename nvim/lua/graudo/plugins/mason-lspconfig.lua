return {
    "williamboman/mason-lspconfig.nvim",
    dependecies = {
        "williamboman/mason"
    },
    config = function()
        require('mason-lspconfig').setup {
            ensure_installed = {
                "rust-analyzer",
                "lua_ls",
                "tsserver",
                "pyright",
                "html",
                "jsonls",
            }
        }
    end,
}
