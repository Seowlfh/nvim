local function setKeymap(mode, keymap, fn, opts)
    opts.buffer = 0
    vim.keymap.set(mode, keymap, fn, opts)
end

local function on_attach(bufnr)
    setKeymap("n", "K", vim.lsp.buf.hover, {})
    setKeymap("n", "<leader>sg", vim.lsp.buf.signature_help, {})
    setKeymap("n", "<leader>gd", vim.lsp.buf.definition, {})
    setKeymap("n", "<leader>gi", vim.lsp.buf.implementation, {})
    setKeymap("n", "<leader>gt", vim.lsp.buf.type_definition, {})
    setKeymap("n", "<leader>df", vim.diagnostic.goto_next, {})
    setKeymap("n", "<leader>dp", vim.diagnostic.goto_prev, {})
    setKeymap("n", "<leader>ds", vim.diagnostic.open_float, {})
    setKeymap("n", "<leader>dl", "<cmd>Telescope diagnostics<cr>", {})
    setKeymap("n", "<leader>gr", "<cmd>Telescope lsp_references<cr>", {})
    setKeymap("n", "<leader>r", vim.lsp.buf.rename, {})
end

local servers = {
    clangd = {},
    cmake = {},
    rust_analyzer = {
        settings = {
            ["rust-analyzer"] = {
                diagnostics = {
                    enable = false,
                },
            },
        },
    },
    nil_ls = {},
    lua_ls = {},
    texlab = {},
    ocamllsp = {
        settings = {
            codelens = { enable = true },
            extendedHover = { enable = true },
        },
    },
    hls = {
        settings = {
            filetypes = { "haskell", "lhaskell", "cabal" },
        },
    },
    dockerls = {},
    docker_compose_language_service = {},
    pyright = {},
    tsserver = {},
    vhdl_ls = {},
}

local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

for server, config in pairs(servers) do
    lspconfig[server].setup({
        on_attach = on_attach,
        settings = config.settings,
        capabilities = capabilities,
        on_init = config.on_init,
    })
end

-- Setup UI
require("lsp.ui").setup_signs()
