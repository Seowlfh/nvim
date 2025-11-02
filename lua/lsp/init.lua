local function setKeymap(mode, keymap, fn, opts)
    opts.buffer = 0
    vim.keymap.set(mode, keymap, fn, opts)
end

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        setKeymap("n", "<leader>k", vim.lsp.buf.hover, {})
        setKeymap("n", "<leader>sg", vim.lsp.buf.signature_help, {})
        setKeymap("n", "<leader>gd", vim.lsp.buf.definition, {})
        setKeymap("n", "<leader>gi", vim.lsp.buf.implementation, {})
        setKeymap("n", "<leader>gt", vim.lsp.buf.type_definition, {})
        setKeymap("n", "<leader>ic", vim.lsp.buf.incoming_calls, {})
        setKeymap("n", "<leader>oc", vim.lsp.buf.outgoing_calls, {})
        setKeymap("n", "<leader>dn", function()
            vim.diagnostic.jump({ count = 1, float = true })
        end, {})
        setKeymap("n", "<leader>dp", function()
            vim.diagnostic.jump({ count = -1, float = true })
        end, {})
        setKeymap("n", "<leader>ds", vim.diagnostic.open_float, {})
        setKeymap("n", "<leader>dl", "<cmd>Telescope diagnostics<cr>", {})
        setKeymap("n", "<leader>gr", "<cmd>Telescope lsp_references<cr>", {})
        setKeymap("n", "<leader>r", vim.lsp.buf.rename, {})
        setKeymap("n", "<leader>ca", vim.lsp.buf.code_action, {})
    end,
})

local servers = {
    "clangd",
    "cmake",
    "rust_analyzer",
    "nil_ls",
    "lua_ls",
    "texlab",
    "dockerls",
    "docker_compose_language_service",
    "pyright",
    "gopls",
}

for _, server in ipairs(servers) do
    vim.lsp.enable(server)
end

-- Setup borders around windows
-- (see https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization#borders)
vim.cmd([[autocmd! ColorScheme * highlight NormalFloat guibg=#1f2335]])
vim.cmd([[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]])

local border = {
    { "🭽", "FloatBorder" },
    { "▔", "FloatBorder" },
    { "🭾", "FloatBorder" },
    { "▕", "FloatBorder" },
    { "🭿", "FloatBorder" },
    { "▁", "FloatBorder" },
    { "🭼", "FloatBorder" },
    { "▏", "FloatBorder" },
}

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = opts.border or border
    return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

-- Setup UI
require("lsp.ui").setup_signs()
