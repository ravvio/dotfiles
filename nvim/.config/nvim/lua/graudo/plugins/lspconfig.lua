return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        'WhoIsSethDaniel/mason-tool-installer.nvim',
        { 'j-hui/fidget.nvim', opts = {} },
    },
    config = function()
        -- Set up global keymaps
        vim.keymap.set('n', '<leader>[', vim.diagnostic.open_float, { desc = "] Open diagnositc" })
        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Prev [<- [D]iagnostic" })
        vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Next ->] [D]iagnostic" })
        vim.keymap.set('n', '<leader>]', vim.diagnostic.setloclist, { desc = "" })

        -- Use LspAttach autocommand to only map the following keys
        -- after the language server attaches to the current buffer
        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('UserLspConfig', {}),
            callback = function(ev)
                -- Enable completion triggered by <c-x><c-o>
                vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

                local map = function(keys, func, desc)
                    vim.keymap.set('n', keys, func, { buffer = ev.buf, desc = 'LSP: ' .. desc })
                end

                -- Buffer local mappings.
                -- See `:help vim.lsp.*` for documentation on any of the below functions

                map('gD', vim.lsp.buf.declaration, "[G]o to [^D]eclaration")
                map('gd', vim.lsp.buf.definition, "[G]o to [D]efinition")
                map('gr', vim.lsp.buf.references, "[G]o to [R]eferences")
                map('gi', vim.lsp.buf.implementation, "[G]o to [I]mplementation")

                map('K', vim.lsp.buf.hover, "[K] Hover documentation")
                map('<leader>D', vim.lsp.buf.type_definition, "Go to [^D]efinition")

                map('<leader>rn', vim.lsp.buf.rename, "[R]e[N]ame")
                map('<leader>fo', function() vim.lsp.buf.format { async = true } end, "[F][O]rmat")
                vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action,
                    { buffer = ev.buffer, desc = "[C]ode [A]ctions" })

                -- The following two autocommands are used to highlight references of the
                -- word under your cursor when your cursor rests there for a little while.
                --    See `:help CursorHold` for information about when this is executed
                --
                -- When you move your cursor, the highlights will be cleared (the second autocommand).
                local client = vim.lsp.get_client_by_id(ev.data.client_id)
                if client and client.server_capabilities.documentHighlightProvider then
                    vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
                        buffer = ev.buf,
                        callback = vim.lsp.buf.document_highlight,
                    })

                    vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
                        buffer = ev.buf,
                        callback = vim.lsp.buf.clear_references,
                    })
                end
            end,
        })

        --  LSP servers and clients are able to communicate to each other what features they support.
        --  By default, Neovim doesn't support everything that is in the LSP Specification.
        --  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
        --  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = vim.tbl_deep_extend(
            'force', capabilities, require('cmp_nvim_lsp').default_capabilities()
        )

        -- Language servers to enable
        local servers = {
            lua_ls = {
                settings = {
                    runtime = { version = 'LuaJIT' },
                    workspace = {
                        checkThridParty = false,
                        library = {
                            '${3rd}/luv/library',
                            unpack(vim.api.nvim_get_runtime_file('', true))
                        }
                    },
                    completition = {
                        callSnippet = 'Replace'
                    }
                }
            },
        }

        -- Setup mason
        require("mason").setup()

        -- Ensure installations
        local ensure_installed = vim.tbl_keys(servers or {})
        vim.list_extend(ensure_installed, {
            "stylua", -- Lua formatting
            "rust_analyzer",
            "tsserver",
            "pyright",
            "html",
            "jsonls",
            "gopls",
            "astro"
        })

        require("mason-tool-installer").setup {
            ensure_installed = ensure_installed
        }

        -- Setup Servers
        require('mason-lspconfig').setup({
            handlers = {
                function(server_name)
                    local server = servers[server_name] or {}
                    -- This handles overriding only values explicitly passed
                    -- by the server configuration above. Useful when disabling
                    -- certain features of an LSP (for example, turning off formatting for tsserver)
                    server.capabilities = vim.tbl_deep_extend(
                        'force',
                        {},
                        capabilities,
                        server.capabilities or {}
                    )
                    require('lspconfig')[server_name].setup(server)
                end,
            }
        })
    end,
}
