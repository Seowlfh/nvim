return {
    -- UI
    {
        "goolord/alpha-nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            local alpha = require("alpha")
            local dashboard = require("alpha.themes.dashboard")

            dashboard.section.header.val = {
                [[                                        ,]],
                [[               ▄                    ,▄▓█▌]],
                [[              ╓██                 ▄█▓███]],
                [[             ▄▓█▌               ▄█████▓M]],
                [[            █▀██     ╓▄▀      ╓█▒▀▀███▌]],
                [[           ║╫╫╫▌ ,▄▓▓▓█      ▄▒╫╫╫╫╫▓▀     ]],
                [[          ▄█▄▄▄▌╫╟███▀     ,████▓▒░╩└      -- T:|M approved]],
                [[        ▄██▀▀▀▒▒▓░▄▀  ,╓,,#▀╫▀██▓▀└        -- E:|J approved]],
                [[    ╓╦╗▓▒░▀▀░╫½╫╫▒╫██╠██▌░▒╫╫▓▀^           ]],
                [[   ╙╫▓╩█▓▓▒▒"└ ▐▀╫╫░█╫╫█▌╫╫▌└             ]],
                [[         ╙▓╫   ▌╫╫╫Ñ╩╨╨╫╫╫╫█       ██╗   ██╗ ██╗ ███╗   ███╗]],
                [[           ╙▀▄▄▓▓▄╫▓███▀▓▓▓╫▓      ██║   ██║ ██║ ████╗ ████║]],
                [[              █▒░░▓██▓▀  █▒▒╫⌐     ██║   ██║ ██║ ██╔████╔██║]],
                [[             ▄▀▀▒████┘   ,▀░║      ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║]],
                [[            ▀Ñ▄╩└ ╙╙     ▀Φ╩¬       ╚████╔╝  ██║ ██║ ╚═╝ ██║]],
                [[                                     ╚═══╝   ╚═╝ ╚═╝     ╚═╝]],
            }

            dashboard.section.buttons.val = {
                dashboard.button("e", "  > New file", ":ene <BAR> startinsert <CR>"),
                dashboard.button("f", "󰍉  > Find file", "Telescope find_files<CR>"),
                dashboard.button("r", "  > Recent", ":Telescope oldfiles<CR>"),
                dashboard.button("a", "A  > Settings", ":e ~/school/planning.org <CR>"),
                dashboard.button("s", "  > Settings", ":e $MYVIMRC | :lcd %:p:h <CR>"),
                dashboard.button(
                    "hs",
                    "  > Home-Manager settings",
                    ":lcd $HOME/prog/nixos-config/ | :e flake.nix<CR>"
                ),
                dashboard.button("q", "  > Quit NVIM", ":qa<CR>"),
            }

            alpha.setup(dashboard.opts)
        end,
    },
    {
        "Shatur/neovim-ayu",
        lazy = false,
        priority = 1000,
        config = function()
            local mirage = false
            local colors = require('ayu.colors')
            colors.generate(mirage)

            require("ayu").setup({
                mirage = mirage,
                overrides = {
                    LineNr = { fg = colors.ui }
                },
            })

            -- Change background according  to time
            local hour = tonumber(vim.fn.strftime("%H"))
            if hour >= 8 and hour < 16 then
                vim.opt.background = "light"
            else
                vim.opt.background = "dark"
            end

            require("ayu").colorscheme()
        end,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("ibl").setup({ scope = { enabled = false } })
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("lualine").setup({
                options = {
                    icons_enabled = true,
                    theme = "ayu",
                    component_separators = { left = "", right = "" },
                    section_separators = { left = "", right = "" },
                    disabled_filetypes = {
                        statusline = { "alpha", "NeogitStatus" },
                        winbar = {},
                    },
                    ignore_focus = {},
                    always_divide_middle = true,
                    globalstatus = true,
                    refresh = {
                        statusline = 1000,
                        tabline = 1000,
                        winbar = 1000,
                    },
                },
                sections = {
                    lualine_a = { "mode" },
                    lualine_b = { "branch", "diff", "diagnostics" },
                    lualine_c = { "filename" },
                    lualine_x = { "require'neovim-apm'.get_apm()", "filetype" },
                    lualine_y = { "progress" },
                    lualine_z = { "location" },
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = { "filename" },
                    lualine_x = { "location" },
                    lualine_y = {},
                    lualine_z = {},
                },
                tabline = {},
                winbar = {},
                inactive_winbar = {},
                extensions = {},
            })
        end,
    },
    {
        "alvarosevilla95/luatab.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("luatab").setup()
        end,
    },
}
