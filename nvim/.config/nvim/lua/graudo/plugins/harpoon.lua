return {
    "ThePrimeagen/harpoon",
    lazy=true,
    dependecies = {
        "nvim-telescope/telescope.nvim"
    },
    config = function()
        require("telescope").load_extension("harpoon")

        local harpoon_mark = require("harpoon.mark")
        local harpoon_ui = require("harpoon.ui")

        vim.keymap.set('n', '<Leader>a', function() harpoon_mark.add_file() end)

        vim.keymap.set('n', '<Leader>-', function() harpoon_ui.toggle_quick_menu() end)

        vim.keymap.set('n', '<C-b>', function() harpoon_ui.nav_file(1) end)
        vim.keymap.set('n', '<C-n>', function() harpoon_ui.nav_file(2) end)
        vim.keymap.set('n', '<C-m>', function() harpoon_ui.nav_file(3) end)

        vim.keymap.set('n', '<C-n>', function() harpoon_ui.nav_next() end)
        vim.keymap.set('n', '<C-p>', function() harpoon_ui.nav_prev() end)
    end,
}
