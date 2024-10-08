return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function()

        local treesitter_parser_config = require "nvim-treesitter.parsers".get_parser_configs()
        treesitter_parser_config.templ = {
            install_info = {
                url = "https://github.com/vrischmann/tree-sitter-templ.git",
                files = {"src/parser.c", "src/scanner.c"},
                branch = "master",
            },
        }

        vim.treesitter.language.register('templ', 'templ')
        vim.treesitter.language.register('markdown', 'mdx')

        local config = require("nvim-treesitter.configs")
        config.setup({
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
