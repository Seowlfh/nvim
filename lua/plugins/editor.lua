return {
    -- NeoGit <3 <3 <3
    {
        "NeogitOrg/neogit",
        dependencies = "nvim-lua/plenary.nvim",
        config = function()
            require("neogit").setup()
        end,
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
        config = function()
            -- Viewer options: One may configure the viewer either by specifying a built-in
            -- viewer method:
            vim.cmd("let g:vimtex_view_method = 'zathura'")

            -- VimTeX uses latexmk as the default compiler backend. If you use it, which is
            -- strongly recommended, you probably don't need to configure anything. If you
            -- want another compiler backend, you can change it as follows. The list of
            -- supported backends and further explanation is provided in the documentation,
            -- see ":help vimtex-compiler".
            vim.cmd("let g:vimtex_compiler_method = 'latexrun'")
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
        config = function()
            require("gitsigns").setup()
        end,
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
        dir = "/home/teto/prog/yabs.nvim",
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
}
