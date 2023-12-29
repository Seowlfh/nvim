vim.bo.formatprg = "clang-format"

vim.api.nvim_create_autocmd({'BufWritePre'}, {
    pattern = { "*.cpp", "*.cc", "*.hh", "*.hpp" },
    callback = function(ev)
       vim.cmd.normal("gggqG")
    end
})
