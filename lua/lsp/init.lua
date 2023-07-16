
local function setKeymap(mode, keymap, fn, opts)
    opts.buffer = 0
    vim.keymap.set(mode, keymap, fn, opts)
end

local function on_attach(bufnr)
    setKeymap("n", "K", vim.lsp.buf.hover, {})
    setKeymap("n", "gd", vim.lsp.buf.definition, {})
    setKeymap("n", "gi", vim.lsp.buf.implementation, {})
    setKeymap("n", "gt", vim.lsp.buf.type_definition, {})
    setKeymap("n", "<leader>df", vim.diagnostic.goto_next, {})
    setKeymap("n", "<leader>dp", vim.diagnostic.goto_prev, {})
    setKeymap("n", "<leader>dl", "<cmd>Telescope diagnostics<cr>", {})
    setKeymap("n", "<leader>gr", "<cmd>Telescope lsp_references<cr>", {})
    setKeymap("n", "<leader>r", vim.lsp.buf.rename, {})
end

local servers = {
    clangd = {},
    cmake = {}
}

local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

for server, config in pairs(servers) do
    lspconfig[server].setup {
        on_attach = on_attach,
        settings = config,
        capabilities = capabilities
    }
end

-- Set up nvim-cmp.
local cmp = require'cmp'

cmp.setup({
    snippet = {
        expand = function(args)
            equire('luasnip').lsp_expand(args.body)
        end,
    },
    window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    }, {
        { name = 'buffer' },
    })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
    }, {
        { name = 'buffer' },
    })
})

