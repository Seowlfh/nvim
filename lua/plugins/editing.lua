return {
    -- Editing
    {
        "kylechui/nvim-surround",
    },
    {
        'jinh0/eyeliner.nvim',
        config = function()
            vim.api.nvim_create_autocmd({'FileType'}, {
                pattern = 'NeogitStatus',
                callback = function()
                    cmd ':EyelinerDisable'
                end
            }) 
            require('eyeliner').setup({
                highlight_on_key = true,
                dim = true,
            })
        end
    },
    {
        'windwp/nvim-autopairs',
        config = function()
            require("nvim-autopairs").setup()
        end
    },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5', -- or                            , branch = '0.1.x',
        dependencies = { {'nvim-lua/plenary.nvim'} },
        config = function()
            local builtin = require('telescope.builtin')

            vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
            vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
            vim.keymap.set('n', '<leader>fd', builtin.diagnostics, {})
            vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols, {})
            vim.keymap.set('n', '<leader>fw', builtin.lsp_workspace_symbols, {})
        end,
    },
    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    },
    -- Autocomplete
    {'neovim/nvim-lspconfig'},
    {'hrsh7th/nvim-cmp'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/cmp-path'},
    {'hrsh7th/cmp-buffer'}
}
