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
    end,
    keys = function()
        local harpoon = require("harpoon")
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

        return {
            {"<Leader>a", function() harpoon:list():append() end},
            {"<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end},
            {"<Leader>e", function() toggle_telescope(
                harpoon:list(),
                require("telescope.themes").get_dropdown{}
            ) end},

            {"<M-1>", function() harpoon:list():select(1) end},
            {"<M-2>", function() harpoon:list():select(2) end},
            {"<M-3>", function() harpoon:list():select(3) end},
            {"<M-4>", function() harpoon:list():select(4) end},

            {"<C-n>", function() harpoon:list():next() end},
            {"<C-p>", function() harpoon:list():prev() end},
        }
    end,
}
