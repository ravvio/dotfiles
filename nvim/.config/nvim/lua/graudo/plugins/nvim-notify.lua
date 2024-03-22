return {
    "rcarriga/nvim-notify",
    prioriy = 900,
    config = function ()
        vim.notify = require("notify")
    end
}
