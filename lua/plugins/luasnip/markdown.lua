local ls = require("luasnip")

local s = ls.s
local i = ls.insert_node
local t = ls.text_node
local fmt = require("luasnip.extras.fmt").fmt

return {
    s(
        "doc",
        fmt(
            [[
    ---
    title: {}
    geometry:
    - top=50mm
    - left=30mm
    header-includes: |
        \usepackage{{fancyhdr}}
        \pagestyle{{fancy}}
        \fancyfoot[CE,CO]{{\thepage}}
    ...

    \newpage
    
    {}
    ]],
            { i(1, "title"), i(2) }
        )
    ),
    s(
        "bold",
        fmt(
            [[
            **{}**{}
        ]],
            {
                i(1, "text"),
                i(2),
            }
        )
    ),
    s("rarr", t("$\\rightarrow$")),
}
