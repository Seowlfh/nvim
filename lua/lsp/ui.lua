local M = {}

function M.setup_signs()
    local text = {
        [vim.diagnostic.severity.ERROR] = "",
        [vim.diagnostic.severity.WARN] = "",
        [vim.diagnostic.severity.HINT] = "",
        [vim.diagnostic.severity.INFO] = "",
    }

    vim.diagnostic.config({
        virtual_lines = true,
        severity_sort = true,
        float = {
            severity_sort = true,
        },
        signs = {
            text = text,
        },
    })
end

return M
