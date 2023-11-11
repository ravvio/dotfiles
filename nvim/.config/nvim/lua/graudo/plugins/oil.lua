return {
    'stevearc/oil.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("oil").setup({
            default_file_explorer = true,
            columns = {
                "icon",
                "size",
            },
            keymaps = {
                ["g."] = "actions.toggle_hidden",
                ["gs"] = "actions.change_sort",
                ["<C-.>"] = "actions.select_vsplit",
                ["<C-,>"] = "actions.select_split",
                ["<C-t>"] = "actions.select_tab",
                ["<Tab>"] = "actions.preview",
                ["<C-c>"] = "actions.close",
                ["<C-l>"] = "actions.refresh",
            }
        })
    end,
}
