return require('packer').startup(function(use)
    -- Packer can manage itself
    use ({ 'wbthomason/packer.nvim' })

    -- Greeter
    use {
        'goolord/alpha-nvim',
        lazy = false,
        config = function ()
            require('plugins.greeter')
        end
    }

    -- Colorscheme
    use ({
        'navarasu/onedark.nvim',
        config = function()
            require('plugins.colorscheme')
        end,
    })
    -- Show indentation lines
    use "lukas-reineke/indent-blankline.nvim"

    -- Status Line
    use ({
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = function()
            require("plugins.statusline")
        end,
    })

    -- Telescope
    use ({
        'nvim-telescope/telescope.nvim',
        tag = '0.1.1', -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'}, },
        config = function()
            require("plugins.telescope")
        end,
    })

    -- Configurations for Nvim LSP
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim'},           -- Optional
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},         -- Required
            {'hrsh7th/cmp-nvim-lsp'},     -- Required
            {'hrsh7th/cmp-buffer'},       -- Optional
            {'hrsh7th/cmp-path'},         -- Optional
            {'saadparwaiz1/cmp_luasnip'}, -- Optional
            {'hrsh7th/cmp-nvim-lua'},     -- Optional

            -- Snippets
            {
                'L3MON4D3/LuaSnip',
                tag = "v1.2.1"
            }, -- Required
            {'rafamadriz/friendly-snippets'}, -- Optional
        },
    }

    -- Neovim comment
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    -- NeoGit <3
    use { 'NeogitOrg/neogit', requires = 'nvim-lua/plenary.nvim', config = function() require('neogit').setup() end }


    -- Surround
    use({
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    })

    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }

    -- Orgmode
    use {
        'nvim-orgmode/orgmode',
        config = function()
            require('plugins.orgmode')
        end
    }

    use {
        'windwp/nvim-autopairs',
        config = function()
            require("nvim-autopairs").setup {}
        end
    }

    use {
        'lervag/vimtex',
        config = function()
            require('plugins.vimtex')
        end
    }
end)
