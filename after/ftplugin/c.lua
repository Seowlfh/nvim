vim.bo.formatprg = "clang-format"

vim.api.nvim_create_autocmd({'BufWritePre'}, {
    pattern = { "*.c", "*.h" },
    callback = function(ev)
       vim.cmd.normal("gggqG")
    end
})
