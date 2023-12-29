return {
    -- NeoGit <3 <3 <3
    { 
        'NeogitOrg/neogit', 
        dependencies = 'nvim-lua/plenary.nvim', 
        config = function() 
            require('neogit').setup() 
        end 
    },
    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter", 
        build = ":TSUpdate",
        lazy = false,
        config = function () 
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = { "c", "cpp", "nix", "rust", "lua", "vim", "vimdoc", "query" },
                auto_install = true,
                highlight = { enable = true },
                indent = { enable = true },  
            })
        end
    },
    -- Orgmode
    {
        'nvim-orgmode/orgmode',
        config = function()
            -- Load custom treesitter grammar for org filetype
            require('orgmode').setup_ts_grammar()

            -- Treesitter configuration
            require('nvim-treesitter.configs').setup {
                -- If TS highlights are not enabled at all, or disabled via `disable` prop,
                -- highlighting will fallback to default Vim syntax highlighting
                highlight = {
                    enable = true,
                    -- Required for spellcheck, some LaTex highlights and
                    -- code block highlights that do not have ts grammar
                    additional_vim_regex_highlighting = {'org'},
                },
                ensure_installed = {'org'}, -- Or run :TSUpdate org
            }

            require('orgmode').setup({
                org_agenda_files = {'~/Dropbox/org/*', '~/my-orgs/**/*'},
                org_default_notes_file = '~/Dropbox/org/refile.org',
            })
        end
    },
    {
        'lervag/vimtex',
        config = function()
            -- Viewer options: One may configure the viewer either by specifying a built-in
            -- viewer method:
            vim.cmd('let g:vimtex_view_method = \'zathura\'')


            -- VimTeX uses latexmk as the default compiler backend. If you use it, which is
            -- strongly recommended, you probably don't need to configure anything. If you
            -- want another compiler backend, you can change it as follows. The list of
            -- supported backends and further explanation is provided in the documentation,
            -- see ":help vimtex-compiler".
            vim.cmd('let g:vimtex_compiler_method = \'latexrun\'')

        end
    },
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            -- disable netrw at the very start of your init.lua
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1

            -- set termguicolors to enable highlight groups
            vim.opt.termguicolors = true


            local function my_on_attach(bufnr)
                local api = require "nvim-tree.api"

                local function opts(desc)
                    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
                end

                -- default mappings
                api.config.mappings.default_on_attach(bufnr)

                -- remove mappings
                -- vim.keymap.del('n', '<C-t>', {buffer = bufnr})

            end

            require("nvim-tree").setup({
                sort_by = "case_sensitive",
                on_attach = my_on_attach, -- Epita coding style right there
                view = {
                    width = 30,
                },
                renderer = {
                    group_empty = true,
                },
                filters = {
                    git_ignored = false,
                },
            })
        end
    },
}
