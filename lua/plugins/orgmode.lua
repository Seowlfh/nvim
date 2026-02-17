return {
    {
        "nvim-orgmode/orgmode",
        event = "VeryLazy",
        ft = { "org" },
        opts = {
            org_agenda_files = { "~/school/*" },
            org_default_notes_file = "~/orgfiles/refile.org",
            org_todo_keywords = { "TODO", "NEXT", "DOING", "STALLED", "|", "DONE" },
        },
    },
    {
        "akinsho/org-bullets.nvim",
        ft = { "org" },
        opts = {},
    },
}
