
vim.api.nvim_create_autocmd({"BufWritePre"}, {
    group = vim.api.nvim_create_augroup("trim-withespaces", {clear = true}),
    desc = "Trim whitespaces before write buffer to file",
    callback = function(_)
        -- Save cursor position
        local cursor = vim.api.nvim_win_get_cursor(0)
        vim.cmd([[keeppatterns %s/\s\+$//e]])
        vim.api.nvim_win_set_cursor(0, cursor)
    end,
})
