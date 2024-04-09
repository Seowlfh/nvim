local utils = require("utils")

local conditions = {
    cmake = utils.file_exists("CMakeLists.txt"),
    make = utils.file_exists("Makefile"),
    cargo = utils.file_exists("Cargo.toml"),
    -- TODO: Find a way to detect a file matching pattern *.cabal
    cabal = function()
        return true
    end,
}

return {
    languages = {
        cpp = {
            tasks = {
                cmake_build = {
                    command = "cmake -B build && cmake --build build",
                    output = "quickfix",
                    tag = "build",
                    condition = conditions.cmake,
                },
                -- gcc_build = {
                --     command = "g++ *",
                --     output = "quickfix",
                --     tag = "build",
                -- },
                -- clang_build = {
                --     command = "clang++ *",
                --     output = "quickfix",
                --     tag = "build",
                -- },
            },
        },
        rust = {
            tasks = {
                cargo_build = {
                    command = "cargo build",
                    output = "quickfix",
                    tag = "build",
                    condition = conditions.cargo,
                },
                cargo_run = {
                    command = "cargo run",
                    output = "terminal",
                    tag = "run",
                    condition = conditions.cargo,
                },
                cargo_clean = {
                    command = "cargo clean",
                    output = "quickfix",
                    tag = "clean",
                    condition = conditions.cargo,
                },
                cargo_test = {
                    command = "cargo test",
                    output = "terminal",
                    tag = "test",
                    condition = conditions.cargo,
                },
            },
        },
        python = {
            tasks = {
                run = {
                    command = "python3 %",
                    output = "terminal",
                    tag = "run",
                },
            },
        },
        haskell = {
            tasks = {
                cabal_run = {
                    command = "cabal run",
                    output = "terminal",
                    tag = "run",
                    condition = conditions.cabal,
                },
                cabal_clean = {
                    command = "cabal clean",
                    output = "terminal",
                    tag = "clean",
                    condition = conditions.cabal,
                },
                cabal_update = {
                    command = "cabal update",
                    output = "terminal",
                    tag = "update",
                    condition = conditions.cabal,
                },
            },
        },
        markdown = {
            tasks = {
                pandoc_build = {
                    command = "pandoc -f markdown -o cours.pdf %.md --number-sections --toc",
                    output = "terminal",
                    tag = "build",
                },
                zathura_view = {
                    command = "zathura cours.pdf",
                    output = "terminal",
                    tag = "view",
                },
            },
        },
    },
    tasks = {
        make_build = {
            command = "make",
            output = "quickfix",
            tag = "build",
            condition = conditions.make,
        },
        make_clean = {
            command = "make",
            output = "quickfix",
            tag = "clean",
            condition = conditions.make,
        },
    },
}
