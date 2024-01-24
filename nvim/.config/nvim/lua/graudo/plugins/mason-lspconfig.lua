return {
    "williamboman/mason-lspconfig.nvim",
    dependecies = {
        "williamboman/mason",
        "Hoffs/omnisharp-extended-lsp.nvim",
        "neovim/nvim-lspconfig",
    },
    config = function()
        require('mason-lspconfig').setup {
            ensure_installed = {
                "rust_analyzer",
                "lua_ls",
                "tsserver",
                "pyright",
                "html",
                "jsonls",
                "texlab",
                "gopls",
                "templ",
                "csharp_ls",
                "astro"
            }
        }

        local capabilities = require('cmp_nvim_lsp').default_capabilities()

        require('mason-lspconfig').setup_handlers({
            function(server_name)
                require("lspconfig")[server_name].setup({
                    capabilities = capabilities
                })
            end,
            ["lua_ls"] = function()
                require("lspconfig").lua_ls.setup({
                    capabilities = capabilities,
                    diagnostics = { globals = { "vim" } },
                })
            end,
        })
    end,
}
