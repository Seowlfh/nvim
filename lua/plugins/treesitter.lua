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

        ts.setup(opts)
        ts.install({
            "go",
            "nix",
            "lua",
            "c",
            "javascript",
        })

        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "go", "nix", "lua", "c", "js" },
            callback = function()
                vim.treesitter.start()
            end,
        })
    end,
}
