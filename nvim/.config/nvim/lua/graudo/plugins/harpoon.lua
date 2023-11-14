return {
    "ThePrimeagen/harpoon",
    config = function()
        require("telescope").load_extension("harpoon")

        local harpoon_mark = require("harpoon.mark")
        local harpoon_ui = require("harpoon.ui")

        vim.keymap.set('n', '<Leader>a', function() harpoon_mark.add_file() end)

        vim.keymap.set('n', '<Leader>-', function() harpoon_ui.toggle_quick_menu() end)

        vim.keymap.set('n', '<Leader>o1', function() harpoon_ui.nav_file(1) end)
        vim.keymap.set('n', '<Leader>o2', function() harpoon_ui.nav_file(2) end)
        vim.keymap.set('n', '<Leader>o2', function() harpoon_ui.nav_file(3) end)
        vim.keymap.set('n', '<Leader>o3', function() harpoon_ui.nav_file(4) end)
        vim.keymap.set('n', '<Leader>o4', function() harpoon_ui.nav_file(5) end)

        vim.keymap.set('n', '<C-n>', function() harpoon_ui.nav_next() end)
        vim.keymap.set('n', '<C-p>', function() harpoon_ui.nav_prev() end)
    end,
}
