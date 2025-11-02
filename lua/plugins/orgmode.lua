return {
    {
        "nvim-orgmode/orgmode",
        event = "VeryLazy",
        ft = { "org" },
        config = function()
            -- Setup orgmode
            require("orgmode").setup({
                org_agenda_files = { "~/school/*" },
                org_default_notes_file = "~/orgfiles/refile.org",
                org_todo_keywords = { "TODO", "NEXT", "DOING", "STALLED", "|", "DONE" },
            })
        end,
    },
    {
        "akinsho/org-bullets.nvim",
        ft = { "org" },
        config = function()
            require("org-bullets").setup()
        end,
    },
}
