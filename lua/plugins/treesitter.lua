return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    lazy = false,
    opts = {
        install_dir = vim.fn.stdpath("data") .. "/site",
    },
    config = function(opts)
        local ts = require("nvim-treesitter")

        local lang = {
            "rust",
            "markdown",
            "go",
            "nix",
            "lua",
            "c",
            "python",
            "bash",
            "ruby",
        }

        ts.setup(opts)
        ts.install(lang)

        vim.api.nvim_create_autocmd("FileType", {
            pattern = lang,
            callback = function()
                vim.treesitter.start()
            end,
        })
    end,
}
