return {
    -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    config = function()
        require "gitsigns".setup {
            signs = {
                add = { text = '+' },
                change = { text = '~' },
                delete = { text = '_' },
                topdelete = { text = '‾' },
                changedelete = { text = '~' },
            },
        }

        local gs = require "gitsigns"
        vim.keymap.set("n", "<leader>os", function() gs.toggle_signs() end, { desc = "T[O]ggle git [S]igns" })
        vim.keymap.set("n", "<leader>ob", function() gs.toggle_current_line_blame() end,
            { desc = "T[O]ggle git [B]lame" })
    end
}
