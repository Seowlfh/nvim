local ls = require("luasnip")

local s = ls.s
local i = ls.insert_node
local rep = require("luasnip.extras").rep
local fmt = require("luasnip.extras.fmt").fmt

return {
    s(
        "index",
        fmt(
            [[
        const {{ {} }} = require("./{}");
        {}();
    ]],
            { i(1, "packageName"), rep(1), rep(1) }
        )
    ),
    s(
        "module",
        fmt(
            [[
        function {}({}) {{
            {}
        }}
        module.exports = {{
            {},
        }}]],
            { i(1, "funcName"), i(2, "params"), i(3), rep(1) }
        )
    ),
}
