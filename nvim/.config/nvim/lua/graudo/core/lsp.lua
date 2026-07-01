-- Enable LSP servers
vim.lsp.enable({
    'clangd',
    'gopls',
    'lua-ls',
    'vtsls',
    'astro-ls',
    'svelte',
    'zls',
})

-- Set up global keymaps
vim.keymap.set('n', '<leader>[', vim.diagnostic.open_float, { desc = "] Open diagnositc" })
vim.keymap.set('n', ']d', function() vim.diagnostic.jump({count = 1, on_jump = vim.diagnostic.open_float }) end, { desc = "Prev [<- [D]iagnostic" })
vim.keymap.set('n', '[d', function() vim.diagnostic.jump({count = -1, on_jump = vim.diagnostic.open_float }) end, { desc = "Next ->] [D]iagnostic" })
vim.keymap.set('n', '<leader>]', vim.diagnostic.setloclist, { desc = "" })

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Use LspAttach autocommand to only map the following keys
    -- after the language server attaches to the current buffer
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

    vim.keymap.set(
        { 'n', 'v' },
        '<leader>ca',
        vim.lsp.buf.code_action,
        { buffer = ev.buffer, desc = "[C]ode [A]ctions" }
    )

    map(
        '<leader>fo',
        function()
            local client = vim.lsp.get_client_by_id(ev.data.client_id)
            if not client then return end
            if not client:supports_method('textDocument/formatting') then return end

            vim.lsp.buf.format({ async = false, timeout_ms = 2000 })
        end,
        "[F][O]rmat"
    )

    -- The following two autocommands are used to highlight references of the
    -- word under your cursor when your cursor rests there for a little while.
    --    See `:help CursorHold` for information about when this is executed
    --
    -- When you move your cursor, the highlights will be cleared (the second autocommand).
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client and client:supports_method('textDocument/documentHighlight') then
        vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = ev.buf,
            callback = vim.lsp.buf.document_highlight,
        })

        vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = ev.buf,
            callback = vim.lsp.buf.clear_references,
        })
    end

    -- Enable completion if supported
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end
  end,
})

-- Add noselect to completeopt otherwise autocompletion is annoying
vim.cmd("set completeopt+=noselect")

