local M = {}

function M.setup_signs()
    local signs = { Error = "", Warn = "", Hint = "", Info = "" }
    for name, icon in pairs(signs) do
        local texthl = "DiagnosticSign" .. name
        vim.fn.sign_define(texthl, { text = icon, texthl = texthl, numhl = texthl })
    end
end

return M
