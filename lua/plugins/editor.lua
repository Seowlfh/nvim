return {
    -- NeoGit <3 <3 <3
    {
        "NeogitOrg/neogit",
        dependencies = "nvim-lua/plenary.nvim",
        keys = function()
            return {
                { "<leader>no", ":Neogit<CR>", desc = "[N]eogit [O]pen" },
            }
        end,
        opts = {}
    },
    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        lazy = false,
        config = function()
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = { "c", "cpp", "nix", "rust", "lua", "vim", "vimdoc", "query" },
                auto_install = true,
                highlight = { enable = true },
                indent = { enable = true },
            })
        end,
    },
    {
        "lervag/vimtex",
        lazy = false,
        init = function()
            vim.g.vimtex_view_method = 'zathura'
        end,
    },
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            -- disable netrw at the very start of your init.lua
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1

            -- set termguicolors to enable highlight groups
            vim.opt.termguicolors = true

            local function my_on_attach(bufnr)
                local api = require("nvim-tree.api")

                local function opts(desc)
                    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
                end

                -- default mappings
                api.config.mappings.default_on_attach(bufnr)

                -- remove mappings
                -- vim.keymap.del('n', '<C-t>', {buffer = bufnr})
            end

            require("nvim-tree").setup({
                sort_by = "case_sensitive",
                on_attach = my_on_attach, -- Epita coding style right there
                view = {
                    width = 30,
                    side = "right",
                },
                renderer = {
                    group_empty = true,
                },
                filters = {
                    git_ignored = false,
                },
            })
        end,
        enabled = false, -- Currently trying out oil
    },
    {
        'stevearc/oil.nvim',
        opts = {
            skip_confirm_for_simple_edits = true,
            view_options = {
                show_hidden = true,
            },
        },
        keys = function()
            local oil = require("oil");

            vim.keymap.set("n", "<leader>oo", function()
                oil.open();
            end);
        end,
        -- Optional dependencies
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = "nvim-lua/plenary.nvim",
        keys = function()
            local harpoon = require("harpoon")

            vim.keymap.set("n", "<leader>a", function()
                harpoon:list():add()
            end)
            vim.keymap.set("n", "<leader>al", function()
                harpoon.ui:toggle_quick_menu(harpoon:list())
            end)

            vim.keymap.set("n", "<leader>h", function()
                harpoon:list():select(1)
            end)
            vim.keymap.set("n", "<leader>j", function()
                harpoon:list():select(2)
            end)
            vim.keymap.set("n", "<leader>k", function()
                harpoon:list():select(3)
            end)
            vim.keymap.set("n", "<leader>l", function()
                harpoon:list():select(4)
            end)
        end,
        config = function()
            local harpoon = require("harpoon")

            harpoon:setup()
        end,
    },
    {
        "lewis6991/gitsigns.nvim",
        event = "BufEnter",
        keys = {
            { "<leader>sb", "<cmd>Gitsigns blame<CR>",      desc = "Git[S]igns [B]lame" },
            { "<leader>sl", "<cmd>Gitsigns blame_line<CR>", desc = "Git[S]igns Blame [L]ine" },
        },
        opts = {},
    },
    {
        "romainl/vim-qf",
        config = function()
            vim.api.nvim_set_keymap("n", "[q", "<Plug>(qf_qf_previous)", {})
            vim.api.nvim_set_keymap("n", "]q", "<Plug>(qf_qf_next)", {})
            vim.api.nvim_set_keymap("n", "<leader>qj", "<Plug>(qf_qf_switch)", {})
            vim.api.nvim_set_keymap("n", "<leader>qt", "<Plug>(qf_qf_toggle)", {})
        end,
    },
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        opts = {
            size = 20,
        },
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
        end,
        config = function()
            local yabs = require("yabs")

            local tasks = require("plugins.tasks.tasks")

            yabs:setup(tasks)
        end,
    },
    {
        -- dir = "/home/teto/prog/heptagon.nvim/",
        "Seowlfh/heptagon.nvim",
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
            formaters_by_ft = {
                lua = { "stylua" },
                nix = { "nixpkgs-fmt" },
                go = { "gofmt" },
                c = { "clang-format" },
                cpp = { "clang-format" },
                sh = { "shellcheck" }
            },

            format_on_save = {
                timeout_ms = 500,
                lsp_format = "fallback",
            },
        },
    },
    {
        "harrisoncramer/gitlab.nvim",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "sindrets/diffview.nvim",
            "stevearc/dressing.nvim", -- Recommended but not required. Better UI for pickers.
            "nvim-tree/nvim-web-devicons" -- Recommended but not required. Icons in discussion tree.
        },
        enabled = true,
        build = function() require("gitlab.server").build(true) end, -- Builds the Go binary
        config = function()
            require("gitlab").setup()
        end,
    },
}
