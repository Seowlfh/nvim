local ls = require('luasnip')

local s = ls.s
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

return {
    s("jsconf", fmt([[
        {{
            "compilerOptions": {{
                {}
            }},
            "include": [ "src/**/*" {} ],
            "exclude": [ "node_modules" {} ]
        }}
    ]], { i(1), i(2), i(3) })),
}
