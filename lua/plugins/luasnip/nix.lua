local ls = require('luasnip')

local s = ls.s
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

return {
    s("shell", fmt(
    [[
      with import <nixpkgs> {{ }};

      mkShell {{
        buildInputs = [
          {}
        ];
      }}
    ]],
    { i(1) })),
}
