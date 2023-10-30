return require('packer').startup(function(use)
    -- Local development of plugins 
    use {
        '/home/teto/programming/neovim-apm',
        config = function ()
            require('plugins.neovim-apm')
        end
    }
    -- use {
    --     'Seowlfh/neovim-apm',
    --     config = function ()
    --         require('plugins.neovim-apm')
    --     end
    -- }

    -- Packer can manage itself
    use ({ 'wbthomason/packer.nvim' })

    -- Snippet
    use({
        "L3MON4D3/LuaSnip",
        requires = 'saadparwaiz1/cmp_luasnip',
        -- install jsregexp (optional!:).
        run = "make install_jsregexp",
        config = function ()
            require('plugins.luasnip')
        end
    })

    -- Autocomplete
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-buffer'

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
        'Shatur/neovim-ayu',
        config = function()
            require('plugins.colorscheme')
        end
    })

    -- Show indentation lines
    use ({
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("ibl").setup({
            })
        end
    })

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

    -- Neovim comment
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    -- NeoGit <3 <3 <3
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

    use {
        'nvim-tree/nvim-tree.lua',
        requires = { 'nvim-tree/nvim-web-devicons' },
        config = function()
	    require('plugins.nvimtree')
	end
    }
end)
