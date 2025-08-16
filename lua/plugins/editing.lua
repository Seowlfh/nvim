return {
    -- Editing
    {
        "kylechui/nvim-surround",
        config = function()
            require("nvim-surround").setup()
        end,
    },
    {
        "jinh0/eyeliner.nvim",
        config = function()
            -- vim.api.nvim_create_autocmd({'FileType'}, {
            --     pattern = 'NeogitStatus',
            --     callback = function()
            --         cmd ':EyelinerDisable'
            --     end
            -- })
            require("eyeliner").setup({
                highlight_on_key = true,
                dim = true,
            })
        end,
    },
    {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup()
        end,
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        keys = function()
            local builtin = require("telescope.builtin")

            vim.keymap.set("n", "<leader>ff", function()
                builtin.find_files({ no_ignore = false, hidden = true })
            end, {})
            vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
            vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
            vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
            vim.keymap.set("n", "<leader>fd", builtin.diagnostics, {})
            vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, {})
            vim.keymap.set("n", "<leader>fw", builtin.lsp_workspace_symbols, {})
            vim.keymap.set("n", "<leader>fm", function()
                builtin.man_pages({ sections = { "ALL" } })
            end, {})
        end,
        opts = {
            defaults = {
                file_ignore_patterns = {
                    ".git/",
                    "node_modules",
                },
            },
        },
    },
    {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end,
    },
    -- Autocomplete
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            {
                "folke/neodev.nvim",
                dependencies = { "hrsh7th/nvim-cmp" },
                opts = {},
                config = function(opts)
                    require("neodev").setup(opts)
                end,
            },
        },
        config = function()
            require("lsp")
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                window = {
                    -- completion = cmp.config.window.bordered(),
                    -- documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                }, {}),
            })

            -- Set configuration for specific filetype.
            cmp.setup.filetype("gitcommit", {
                sources = cmp.config.sources({
                    { name = "git" }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
                }, {}),
            })
        end,
    },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-path" },
}
