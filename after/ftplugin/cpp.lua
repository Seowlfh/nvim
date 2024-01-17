vim.bo.formatprg = "clang-format"

local autogrp_name = "CPP Format"

local augroup = vim.api.nvim_create_augroup(autogrp_name, {})

vim.api.nvim_clear_autocmds({ group = augroup })

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    group = autogrp_name,
    pattern = { "*.cpp", "*.cc", "*.hh", "*.hpp" },
    callback = function(ev) -- Format current buffer local line,
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        vim.cmd.normal("gggqG")
        vim.api.nvim_win_set_cursor(0, { line, col })
    end,
})
