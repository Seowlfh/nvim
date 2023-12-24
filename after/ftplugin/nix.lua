vim.o.shiftwidth = 2

vim.bo.formatprg = "nixpkgs-fmt"

vim.api.nvim_create_autocmd({'BufWritePre'}, {
    callback = function(ev)
       vim.cmd.normal("gggqG")
    end
})
