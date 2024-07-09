return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependecies = {
        "nvim-telescope/telescope.nvim",
        "nvim-lua/plenary.nvim"
    },
    config = function()
        local harpoon = require("harpoon")
        harpoon:setup({})

        local conf = require("telescope.config").values

        -- basic telescope configuration
        local function toggle_telescope(harpoon_files, opts)
            local file_paths = {}
            for _, item in ipairs(harpoon_files.items) do
                table.insert(file_paths, item.value)
            end

            opts = opts or {}

            require("telescope.pickers").new(opts, {
                prompt_title = "Harpoon",
                finder = require("telescope.finders").new_table({
                    results = file_paths,
                }),
                previewer = conf.file_previewer({}),
                sorter = conf.generic_sorter({}),
                theme = "dropdown",
            }):find()
        end

        vim.keymap.set("n", "<Leader>a", function() harpoon:list():append() end, { desc = "[A]dd to Harpoon" })
        vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Toggle Harpoon quick menu" })
        vim.keymap.set("n", "<Leader>e",
            function()
                toggle_telescope(harpoon:list())
            end,
            { desc = "Toggle Harpoon telescope" }
        )

        vim.keymap.set("n", "<M-1>", function() harpoon:list():select(1) end)
        vim.keymap.set("n", "<M-2>", function() harpoon:list():select(2) end)
        vim.keymap.set("n", "<M-3>", function() harpoon:list():select(3) end)
        vim.keymap.set("n", "<M-4>", function() harpoon:list():select(4) end)

        vim.keymap.set("n", "<C-n>", function() harpoon:list():next() end, { desc = "Go to [N]ext harpooned file." })
        vim.keymap.set("n", "<C-p>", function() harpoon:list():prev() end, {desc = "Go to [P]revious harpooned file." })
    end,
}
