vim.bo.formatprg = "clang-format"

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = { "*.cpp", "*.cc", "*.hh", "*.hpp" },
    callback = function(ev)
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        vim.cmd.normal("gggqG")
        vim.api.nvim_win_set_cursor(0, { line, col })
    end,
})
