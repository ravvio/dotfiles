-- Seach on wikipedia
vim.api.nvim_create_user_command(
    "Wiki",
    function (opts)
        local s = opts.fargs[1]:gsub(" ", "_")
        vim.cmd("!firefox --new-window 'https://en.wikipedia.org/wiki/" .. s .. "'")
    end,
    { nargs = 1 }
)

-- Seach on google
vim.api.nvim_create_user_command(
    "Google",
    function (opts)
        local s = opts.fargs[1]:gsub(" ", "+")
        vim.cmd("!firefox --new-window 'https://www.google.com/search?q=" .. s .. "'")
    end,
    { nargs = 1 }
)
