local M = {}

function M.setup(autogrp_name, pattern)
    local augroup = vim.api.nvim_create_augroup(autogrp_name, {})

    vim.api.nvim_clear_autocmds({ group = augroup })

    vim.api.nvim_create_autocmd({ "BufWritePre" }, {
        group = autogrp_name,
        pattern = pattern,
        callback = function(ev)
            local line, col = unpack(vim.api.nvim_win_get_cursor(0))
            vim.cmd.normal("gggqG")
            local height = vim.api.nvim_buf_line_count(0)
            line = (line > height) and height or line
            vim.api.nvim_win_set_cursor(0, { line, col })
        end,
    })
end

return M
