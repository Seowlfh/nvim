local ls = require("luasnip")

local s = ls.s
local i = ls.insert_node
local rep = require("luasnip.extras").rep
local fmt = require("luasnip.extras.fmt").fmt

return {
    s(
        "entity",
        fmt(
            [[
                entity {} is
                    port
                    (
                        {}
                    );
                end entity;
            ]],
            { i(1, "entityName"), i(2)}
        )
    ),
    s(
        "process",
        fmt(
            [[
                process({}) is
                    {}
                begin
                    {}
                end process;
            ]],
            { i(1, "params"), i(2), i(3)}
        )
    ),
    s(
        "architecture",
        fmt(
            [[
                architecture {} of {} is
                    {}
                begin
                    {}
                end architecture;
            ]],
            { i(1), i(2), i(3), i(4)}
        )
    ),
}
