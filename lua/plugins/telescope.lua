return {
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
            layout_strategy = "horizontal",
            layout_config = {
                prompt_position = "top",
                width = { padding = 0 },
                height = { padding = 0 },
                preview_width = 0.5,
            },
            sorting_strategy = "ascending",
        },
    },
}
