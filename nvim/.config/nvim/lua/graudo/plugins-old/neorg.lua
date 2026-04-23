return {
    "nvim-neorg/neorg",
    lazy = false,
    version = "*",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "pysan3/neorg-templates", dependencies = "L3MON4D3/LuaSnip" },
    },
    config = function()
        -- Autocommand to make the concealer work as intended
        vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
            pattern = { "*.norg" },
            command = "set conceallevel=3"
        })

        local neorg = require("neorg")

        neorg.setup {
            load = {
                ["core.defaults"] = {}, -- Loads default behaviour
                ["core.concealer"] = {  -- Adds pretty icons to your documents
                    config = {
                        icon_preset = "diamond",
                    },
                },
                ["core.dirman"] = { -- Manages Neorg workspaces
                    config = {
                        workspaces = {
                            notes = "~/notes",
                        },
                        default_workspace = "notes",
                    },
                },
                ["core.summary"] = {       -- Permits to create a summary of the workspace
                },
                ["external.templates"] = { -- Use templates
                },
            },
        }
    end,
}
