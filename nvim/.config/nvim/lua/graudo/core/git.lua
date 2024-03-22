-- Fast amend
vim.api.nvim_create_user_command(
    "Amend",
    function (opts)
        local bufname = vim.api.nvim_buf_get_name(0)
        local Job = require("plenary.job")

        Job:new({
            command = "git",
            args = {'add', bufname}
        }):sync()

        Job:new({
            command = "git",
            args = {"commit", "--amend", "--no-edit"},
            on_exit = function()
                local s = vim.split(bufname, "[/\\]")
                vim.notify("Amended " .. s[#s])
            end,
        }):sync()
    end,
    {}
)
