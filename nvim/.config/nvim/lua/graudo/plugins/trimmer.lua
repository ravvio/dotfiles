return {
    "ravvio/trimmer-nvim",
    config = function ()
        require("trimmer-nvim").setup({
            exclude = {"oil"}
        })
    end
}
