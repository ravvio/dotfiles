local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

local markdown = {
    s("ln", {
        t"[", i(1), t"](",
        f(function(name)
            return string.lower(name[1][1])
                :gsub(" ", "-")
                :gsub("'", "-")
                :gsub('"', "-")
        end, {1}),
        t")"
    })
}

ls.add_snippets("mdx", markdown)
ls.add_snippets("md", markdown)
