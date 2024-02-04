return {
	"L3MON4D3/LuaSnip",
	-- follow latest release.
	version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!).
	build = "make install_jsregexp",
    config = function()
        require("luasnip.loaders.from_lua").load({
            paths = {
                "~/.config/nvim/luasnippets"
            }
        })

        local luasnip = require('luasnip')
        luasnip.config.set_config {
            updateevents="TextChanged,TextChangedI"
        }

        vim.keymap.set({"i", "s"}, "<C-k>", function()
            if luasnip.expand_or_jumpable() then luasnip.expand_or_jump()
            end
        end, {silent = true})
        vim.keymap.set({"i", "s"}, "<C-j>", function()
            if luasnip.jumpable(-1) then luasnip.jump(-1)
            end
        end, {silent = true})
        vim.keymap.set({"i", "s"}, "<C-l>", function()
            if luasnip.choice_active() then luasnip.change_choice(1)
            end
        end, {silent = true})

        vim.keymap.set({"n"}, "<leader><leader>s",
            "<cmd>source ~/.config/nvim/luasnippets/snippets.lua<CR>"
        )
    end,
}
