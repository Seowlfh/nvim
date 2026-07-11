local utils = require("utils")

local conditions = {
    cmake = utils.file_exists("CMakeLists.txt"),
    make = utils.file_exists("Makefile"),
    cargo = utils.file_exists("Cargo.toml"),
    flake = utils.file_exists("flake.nix"),
}

local tasks = {
    languages = {
        go = {
            tasks = {
                go_run = {
                    command = "go run .",
                    output = "terminal",
                    tag = "run",
                },
                go_build = {
                    command = "go build .",
                    output = "terminal",
                    tag = "build",
                },
                go_test = {
                    command = "go test .",
                    output = "terminal",
                    tag = "build",
                },
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
                    output = "quickfix",
                    tag = "run",
                    condition = conditions.cargo,
                },
                cargo_clean = {
                    command = "cargo clean",
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
    },
    tasks = {
        make = {
            command = "make",
            output = "quickfix",
            condition = conditions.make,
            tag = "build",
        },
        make_check = {
            command = "make check",
            output = "quickfix",
            condition = conditions.make,
            tag = "test",
        },
        make_clean = {
            command = "make clean",
            output = "quickfix",
            condition = conditions.make,
            tag = "clean",
        },
        cmake_configure = {
            command = "cmake -S . -B build",
            output = "quickfix",
            tag = "configure",
            condition = conditions.cmake,
        },
        cmake_build = {
            command = "cmake --build build",
            output = "quickfix",
            tag = "build",
            condition = conditions.cmake,
        },
        -- nix_build = {
        --     command = "nix build",
        --     output = "quickfix",
        --     tag = "build",
        --     condition = conditions.flake,
        -- },
        -- nix_run = {
        --     command = "nix run",
        --     output = "quickfix",
        --     tag = "run",
        --     condition = conditions.flake,
        -- },
    },
    opts = {
        output_types = {
            quickfix = {
                open_on_run = "always",
            },
        },
    },
}

return {
    "Seowlfh/yabs.nvim",
    dev = false,
    dir = "/home/teto/prog/yabs.nvim",
    branch = "main",
    keys = function()
        local yabs = require("yabs")

        vim.keymap.set("n", "<leader>tl", ":Telescope yabs tasks<CR>")
        vim.keymap.set("n", "<leader>tb", function()
            yabs:run_task("build")
        end)
        vim.keymap.set("n", "<leader>tr", function()
            yabs:run_task("run")
        end)
        vim.keymap.set("n", "<leader>tc", function()
            yabs:run_task("clean")
        end)
        vim.keymap.set("n", "<leader>tt", function()
            yabs:run_task("test")
        end)
        vim.keymap.set("n", "<leader>tv", function()
            yabs:run_task("view")
        end)
        vim.keymap.set("n", "<leader>to", function()
            yabs:run_task("configure")
        end)
    end,
    config = function()
        local yabs = require("yabs")
        yabs:setup(tasks)
    end,
}
