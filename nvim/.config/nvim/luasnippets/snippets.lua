local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

ls.add_snippets("dart", {
    s("nw", fmt([[
    class {1} extends StatelessWidget {{
        const {2}({{
            super.key
        }});

        @override
        Widget build(BuildContext context) {{
            return {3};
        }}
    }}
    ]], {
        i(1),
        rep(1),
        i(3)
    }))
})

local markdown = require("graudo.snippets.markdown");
ls.add_snippets("mdx", markdown)
ls.add_snippets("md", markdown)
