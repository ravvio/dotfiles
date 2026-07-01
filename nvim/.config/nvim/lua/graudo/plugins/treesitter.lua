return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function()
        vim.treesitter.language.register('markdown', 'mdx')

        require("nvim-treesitter").setup({
            ensure_installed = {
                "lua", "c", "rust", "norg", "javascript",
                "typescript", "html", "css", "python",
                "json", "markdown", "markdown_inline", "dart", "latex",
                "go", "ocaml", "templ", "dockerfile", "bash",
                "c_sharp", "astro"
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
