vim.bo.formatprg = "clang-format"

vim.api.nvim_create_autocmd({'BufWritePre'}, {
    callback = function(ev)
       vim.cmd.normal("gggqG")
    end
})
