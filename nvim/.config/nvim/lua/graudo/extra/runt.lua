vim.api.nvim_create_user_command(
    "Runt",
    function(opts)
        local name = vim.api.nvim_buf_get_name(0)
        vim.cmd("vsplit term://" .. name)
    end,
    {}
)
