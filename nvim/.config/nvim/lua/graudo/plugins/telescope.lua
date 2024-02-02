return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        require("telescope").setup {
            pickers = {
                lsp_implementations = {
                    theme = "cursor"
                },
                lsp_references = {
                    theme = "cursor"
                }
            }
        }

        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>ff", builtin.git_files, {})
        vim.keymap.set("n", "<leader>lf", builtin.find_files, {})

        vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
        vim.keymap.set("n", "<leader>fb", builtin.buffers, {})

        vim.keymap.set("n", "<leader>fe", builtin.diagnostics, {})
        vim.keymap.set("n", "<leader>fi", builtin.lsp_implementations, {})
        vim.keymap.set("n", "<leader>fr", builtin.lsp_references, {})

        vim.keymap.set("n", "<leader>fc", builtin.git_commits, {})
    end,
}
