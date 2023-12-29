vim.o.shiftwidth = 4

vim.bo.formatprg = "stylua --search-parent-directories - 2>/dev/null"

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = { "*.lua" },
    callback = function(ev)
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        vim.cmd.normal("gggqG")
        vim.api.nvim_win_set_cursor(0, { line, col })
    end,
})
