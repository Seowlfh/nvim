return require('packer').startup(function(use)
    -- Local development of plugins 
    -- use {
    --     '/home/teto/programming/neovim-apm',
    --     config = function ()
    --         require('plugins.neovim-apm')
    --     end
    -- }
    -- use {
    --     'Seowlfh/neovim-apm',
    --     config = function ()
    --         require('plugins.neovim-apm')
    --     end
    -- }

    -- Packer can manage itself
    use { 'wbthomason/packer.nvim' }

    -- UI
    use {
        'goolord/alpha-nvim',
        lazy = false,
        config = function ()
            require('plugins.greeter')
        end
    }

    use {
        'Shatur/neovim-ayu',
        config = function()
            require('plugins.colorscheme')
        end
    }

    use {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("ibl").setup({
                scope = { enabled = false }
            })
        end
    }

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require("plugins.statusline")
        end,
    }

    use { 
        'alvarosevilla95/luatab.nvim', 
        requires = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('luatab').setup()
        end,
    }

    -- NeoGit <3 <3 <3
    use { 'NeogitOrg/neogit', requires = 'nvim-lua/plenary.nvim', config = function() require('neogit').setup() end }


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

    -- Editing
    use{
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    }

    use {
        'jinh0/eyeliner.nvim',
        config = function()
            require'eyeliner'.setup {
                highlight_on_key = true,
                dim = true,
            }
        end
    }

    use {
        'windwp/nvim-autopairs',
        config = function()
            require("nvim-autopairs").setup()
        end
    }

    use{
        "L3MON4D3/LuaSnip",
        requires = 'saadparwaiz1/cmp_luasnip',
        -- install jsregexp (optional!:).
        run = "make install_jsregexp",
        config = function ()
            require('plugins.luasnip')
        end
    }

    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.1', -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'}, },
        config = function()
            require("plugins.telescope")
        end,
    }

    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    -- Auocomplete
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-buffer'
end)
