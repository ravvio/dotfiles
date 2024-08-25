return {
    -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VeryLazy', -- Sets the loading event to 'VeryLazy'
    config = function()
        require('which-key').setup()

        -- Document existing key chains
        require('which-key').add {
            { "<leader>c",  group = "[C]ode" },
            { "<leader>d",  group = "[D]ocument" },
            { "<leader>g",  group = "[G]o" },
            { "<leader>o",  group = "T[O]ggle" },
            { "<leader>r",  group = "[R]ename" },
            { "<leader>s",  group = "[F]ind" },
            { "<leader>w",  group = "[W]orkspace" },
        }
    end,
}
