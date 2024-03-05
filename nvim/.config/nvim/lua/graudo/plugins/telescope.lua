return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { -- If encountering errors, see telescope-fzf-native README for install instructions
            'nvim-telescope/telescope-fzf-native.nvim',

            -- `build` is used to run some command when the plugin is installed/updated.
            -- This is only run then, not every time Neovim starts up.
            build = 'make',

            -- `cond` is a condition used to determine whether this plugin should be
            -- installed and loaded.
            cond = function()
                return vim.fn.executable 'make' == 1
            end,
        },
        { 'nvim-telescope/telescope-ui-select.nvim' },
    },
    config = function()
        require("telescope").setup {
            mappings = {
            },
            pickers = {
                help_tags = {
                    theme = "dropdown"
                },
                lsp_implementations = {
                    theme = "ivy"
                },
                lsp_references = {
                    theme = "ivy"
                }
            },
            extensions = {
                ['ui-select'] = {
                    require('telescope.themes').get_dropdown(),
                },
            }
        }

        -- If installed enable fzf native
        pcall(require("telescope").load_extension, 'fzf')
        pcall(require("telescope").load_extension, 'ui-select')

        local builtin = require("telescope.builtin")

        vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[F]ind [H]elp tags" })

        vim.keymap.set("n", "<leader>ff", function()
            builtin.git_files({ show_untracked = true })
        end, { desc = "[F]ind Git [F]iles" })
        vim.keymap.set("n", "<leader>fs", builtin.find_files, { desc = "[F]ile [S]earch" })
        vim.keymap.set("n", "<leader>f.", builtin.oldfiles, { desc = '[F]ile recent files ("." for repeat)' })
        vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "[F]ind [B]uffer" })

        vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "[F]ind by [G]rep" })
        vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "[F]ind [W]ord" })
        vim.keymap.set("n", "<leader>ft", builtin.builtin, { desc = "[F]ind [T]his selected" })

        vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "[F]ind [D]iagnostics" })
        vim.keymap.set("n", "<leader>fi", builtin.lsp_implementations, { desc = "[F]ind [I]implementations" })
        vim.keymap.set("n", "<leader>fr", builtin.lsp_references, { desc = "[F]ind [R]eferences" })

        vim.keymap.set("n", "<leader>fc", builtin.git_commits, { desc = "[F]ind [C]commits" })

        vim.keymap.set('n', '<leader>/', function()
            -- You can pass additional configuration to telescope to change theme, layout, etc.
            builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                winblend = 10,
                previewer = false,
            })
        end, { desc = '[/] Fuzzily search in current buffer' })
    end,
}
