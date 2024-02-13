vim.bo.formatprg = "clang-format"

-- vim.api.nvim_create_autocmd({ "BufWritePre" }, {
--     pattern = { "*.c", "*.h" },
--     callback = function(_)
--         local line, col = unpack(vim.api.nvim_win_get_cursor(0))
--         vim.cmd.normal("gggqG")
-- local height = vim.api.nvim_buf_line_count(0)
-- line = (line > height) and height or line
--         vim.api.nvim_win_set_cursor(0, { line, col })
--     end,
-- })
