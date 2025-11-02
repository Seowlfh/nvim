-- Filetypes
vim.filetype.add({
    filename = {
        -- Pattern priority ???
        ["docker-compose.yaml"] = "yaml.docker-compose",
        ["docker-compose.yml"] = "yaml.docker-compose",
        ["compose.yaml"] = "yaml.docker-compose",
        ["compose.yml"] = "yaml.docker-compose",
    },
})

vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("close_with_q", {}),
    pattern = { "oil", "qf", "toggleterm", "help" },
    callback = function()
        vim.opt_local.buflisted = false
        vim.keymap.set("n", "q", "<Cmd>close<CR>", { buffer = 0 })
    end,
})
