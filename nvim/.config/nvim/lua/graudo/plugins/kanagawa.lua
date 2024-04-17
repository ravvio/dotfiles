return {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    config = function()
        require("kanagawa").setup({
            undercurl = true,
            commentStyle = { italic = true },
        })
    end,
}
