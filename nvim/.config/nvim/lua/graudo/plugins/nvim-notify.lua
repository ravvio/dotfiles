return {
    "rcarriga/nvim-notify",
    prioriy = 900,
    config = function ()
        local noti = require("notify")
        noti.setup({
            render = "wrapped-compact",
            timeout = 3000,
            minumum_width = 30,
        })
        vim.notify = noti
    end
}
