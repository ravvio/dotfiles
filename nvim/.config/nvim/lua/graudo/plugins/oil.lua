return {
    'stevearc/oil.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    config = function()
        vim.keymap.set(
            "n", "-", "<CMD>Oil<CR>",
            { desc = "Open parent directory" }
        )
        vim.keymap.set(
            "n", "<CR>-", require("oil").toggle_float,
            { desc = "Open parent directory in floating window" }
        )

        require("oil").setup({
            default_file_explorer = true,
            columns = {
                "icon",
                "size",
            },
            win_options = {
            },
            use_default_keymaps = false,
            keymaps = {
                ["g."] = "actions.toggle_hidden",
                ["gs"] = "actions.change_sort",
                ["<CR>"] = "actions.select",
                ["<C-n>"] = "actions.select_vsplit",
                ["<C-m>"] = "actions.select_split",
                ["<C-t>"] = "actions.select_tab",
                ["<Tab>"] = "actions.preview",
                ["<C-c>"] = "actions.close",
                ["<C-e>"] = "actions.refresh",
            }
        })
    end,
}
