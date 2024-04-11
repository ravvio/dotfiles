local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep


local golang = {
    s("api", fmt([[
    func {1}(w http.ResponseWriter, r *http.Request) {{
        {2}
    }}
    ]], {
        i(1),
        i(2),
    }))
}

ls.add_snippets("go", golang)
