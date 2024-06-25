vim.cmd.colorscheme('gruvbox-material')

require("lualine").setup {
    options = {
        theme = "gruvbox-material"
    }
}

-- Colorscheme
vim.api.nvim_create_user_command(
    "Colorscheme",
    function (opts)
        local colorscheme = opts.fargs[1]
        vim.cmd.colorscheme(colorscheme)
        require("lualine").setup {
            options = {
                theme = colorscheme
            }
        }
    end,
    { nargs = 1 }
)
