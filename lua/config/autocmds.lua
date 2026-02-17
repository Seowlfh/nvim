vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("close_with_q", {}),
    pattern = { "oil", "qf", "toggleterm", "help" },
    callback = function()
        vim.opt_local.buflisted = false
        vim.keymap.set("n", "q", "<Cmd>close<CR>", { buffer = 0 })
    end,
})
