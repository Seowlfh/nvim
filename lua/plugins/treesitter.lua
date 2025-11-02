return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    lazy = false,
    config = function()
        require("nvim-treesitter").setup({
            ensure_installed = {
                "c",
                "cpp",
                "nix",
                "rust",
                "lua",
                "query",
                "vim",
                "vimdoc",
            },
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
            ignore_install = { "org" },
        })
    end,
}
