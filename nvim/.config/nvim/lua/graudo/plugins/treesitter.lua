return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        
        local config = require("nvim-treesitter.configs")
        config.setup({
            ensure_installed = {
                "lua", "c", "rust", "norg", "javascript",
                "typescript", "html", "css", "elixir", "python",
                "json", "markdown", "latex", "dart", "latex",
                "go", "ocaml"
            },

            auto_install = false,

            highlight = {
                enable = true,
                -- disable for large files
                disable = function(lang, buf)
                    local max_filesize = 1024 * 1024 -- 1 MB
                    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                    if ok and stats and stats.size > max_filesize then
                        return true
                    end
                end,
            }

        })
    end,
}
