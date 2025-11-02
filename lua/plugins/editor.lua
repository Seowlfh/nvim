return {
    -- NeoGit <3 <3 <3
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
        },
        keys = function()
            return {
                { "<leader>no", ":Neogit<CR>", desc = "[N]eogit [O]pen" },
            }
        end,
        opts = {},
    },
    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        build = ":TSUpdate",
        lazy = false,
        config = function()
            require("nvim-treesitter").setup({
                ensure_installed = { "c", "cpp", "nix", "rust", "lua", "vim", "vimdoc", "query" },
                auto_install = true,
                highlight = { enable = true },
                indent = { enable = true },
                ignore_install = { "org" },
            })
        end,
    },
    {
        "lervag/vimtex",
        lazy = false,
        init = function()
            vim.g.vimtex_view_method = "zathura"
        end,
    },
    {
        "stevearc/oil.nvim",
        opts = {
            skip_confirm_for_simple_edits = true,
            view_options = {
                show_hidden = true,
            },
        },
        keys = function()
            local oil = require("oil")

            vim.keymap.set("n", "<leader>oo", function()
                oil.open()
            end)
        end,
        -- Optional dependencies
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    {
        "lewis6991/gitsigns.nvim",
        event = "BufEnter",
        keys = {
            { "<leader>sb", "<cmd>Gitsigns blame<CR>", desc = "Git[S]igns [B]lame" },
            { "<leader>sl", "<cmd>Gitsigns blame_line<CR>", desc = "Git[S]igns Blame [L]ine" },
        },
        opts = {},
    },
    {
        "romainl/vim-qf",
        config = function()
            vim.api.nvim_set_keymap("n", "<leader>qj", "<Plug>(qf_qf_switch)", {})
            vim.api.nvim_set_keymap("n", "<leader>qt", "<Plug>(qf_qf_toggle)", {})
        end,
    },
    {
        "Seowlfh/yabs.nvim",
        dev = false,
        dir = "/home/teto/prog/yabs.nvim",
        branch = "dev",
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

            local tasks = require("plugins.tasks.tasks")

            yabs:setup(tasks)
        end,
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {},
    },
    {
        "stevearc/conform.nvim",
        event = "BufWritePre",
        opts = {
            formatters_by_ft = {
                lua = { "stylua" },
                nix = { "nixpkgs-fmt" },
                go = { "gofmt" },
                c = { "clang-format" },
                cpp = { "clang-format" },
                sh = { "shellcheck" },
            },

            format_on_save = {
                timeout = 500,
            },
        },
    },
}
