return {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            nix = { "nixpkgs_fmt" },
            go = { "gofmt" },
            c = { "clang-format" },
            cpp = { "clang-format" },
            sh = { "shellcheck" },
        },

        format_on_save = {
            timeout = 500,
        },
    },
}
