-- Previous config
-- local lsp = require('lsp-zero')
-- lsp.preset('recommended')
-- 
-- lsp.setup()

local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

lsp.ensure_installed({
  -- Replace these with whatever servers you want to install
  'clangd',
  'ltex',
  'pylsp',
})

lsp.setup()


