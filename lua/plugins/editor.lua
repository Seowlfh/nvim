return {
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
        },
        keys = {
            { "<leader>no", ":Neogit<CR>", desc = "[N]eogit [O]pen" },
        },
        opts = {},
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
}
