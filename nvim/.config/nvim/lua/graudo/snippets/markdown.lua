local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

return {
    s("ln", fmt("[{1}]({2})"), {
        i(1),
        f(function(name)
            return string.lower(name[1][1]):gsub(" ", "-")
        end, {1}),
    })
}
