local ls = require("luasnip")

local s = ls.s
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

return {
    s(
        "shell",
        fmt(
            [[
      with import <nixpkgs> {{ }};

      mkShell {{
        buildInputs = [
          {}
        ];
      }}
    ]],
            { i(1) }
        )
    ),
    s(
        "flake",
        fmt(
            [[
    {{
      inputs = {{
        nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
      }};

      outputs = {{ self, nixpkgs }}:
        let
          system = "x86_64-linux";
          pkgs = nixpkgs.legacyPackages.${{system}};
        in
        {{
          devShells.${{system}}.default = pkgs.mkShell
            {{
              buildInputs = with pkgs; [
                # Fill stuff here
                {}
              ];
            }};
        }};
    }}
    ]],
            { i(1) }
        )
    ),
}
