local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

return {
    {
        'hrsh7th/cmp-nvim-lsp',
    },
    {
        'hrsh7th/cmp-buffer'
    },
    {
        'hrsh7th/cmp-path'
    },
    {
        'hrsh7th/cmp-cmdline'
    },
    {
        'hrsh7th/cmp-nvim-lua'
    },
    {
        'hrsh7th/nvim-cmp',

        dependencies = {
            'cmp-git',
            'cmp-nvim-lsp',
            'cmp-nvim-lua',
            'cmp-buffer',
            'cmp-path',
            'cmp-cmdline',
            'cmp_luasnip',
            'vim-dadbod-completion',
            'LuaSnip'
        },

        config = function()
            local cmp = require('cmp')

            cmp.setup({
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end
                },
                window = {},
                mapping = cmp.mapping.preset.insert ({
                    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-e>"] = cmp.mapping.close(),
                    -- ["<Tab>"] = cmp.mapping(function(fallback)
                    --     if cmp.visible() then cmp.select_next_item()
                    --     elseif has_words_before() then cmp.complete()
                    --     else fallback()
                    --     end
                    -- end, { "i", "s" }),
                    -- ["<S-Tab"] = cmp.mapping(function(fallback)
                    --     if cmp.visible() then cmp.select_prev_item()
                    --     else fallback()
                    --     end
                    -- end, { "i", "s" }),
                    ["<C-n>"] = cmp.mapping.select_next_item(),
                    ["<C-p>"] = cmp.mapping.select_prev_item(),
                    ["<C-Space>"] = cmp.mapping.confirm({ select = true }),
                    ["<C-y>"] = cmp.mapping.complete(),
                }),
                sources = cmp.config.sources({
                    {name = 'nvim_lua'},
                    {name = 'nvim_lsp'},
                    {name = 'luasnip'},
                }, {
                    { name = 'buffer' },
                    { name = 'path' }
                }
                ),
            })

            -- Set configuration for specific filetype.
            cmp.setup.filetype('gitcommit', {
                sources = cmp.config.sources({
                    { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
                }, {
                    { name = 'buffer' },
                })
            })

            -- SQL using dadbod
            cmp.setup.filetype('sql', {
                sources = {
                    { name = 'vim-dadbod-completion' },
                    { name = 'buffer' }
                }
            })


            -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline({ '/', '?' }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = 'buffer' }
                }
            })

            -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline(':', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = 'path' }
                }, {
                    { name = 'cmdline' }
                })
            })
        end,
    }
}
