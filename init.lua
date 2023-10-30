-- T:|M approved
require("plugins")
require("lsp")
require("keybinds")

-- Indentation
vim.opt.tabstop = 8 -- Tab size
vim.opt.shiftwidth = 4 -- Indent size
vim.opt.expandtab = true -- Use spaces instead of tabs

-- Search
vim.opt.incsearch = true -- Highlight matches while typing search query
vim.opt.hlsearch = false -- Highlight previous search matches
vim.opt.ignorecase = true -- Ignore case when searching
vim.opt.smartcase = true -- Case sensitive search if the query contains upper case letters

-- Interface
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.colorcolumn = "80" -- Highlight column 80
vim.opt.cursorline = true -- Highlight current line
vim.opt.scrolloff = 10
vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true
vim.opt.showmode = false -- Display keystrokes
vim.opt.showcmd = true -- Show command while typing
vim.opt.laststatus = 2 -- Always show status bar
vim.opt.wildmenu = true -- Better tab completion while typing commands
vim.opt.scrolloff = 10 -- Always keep 10 line visiblie above or under the cursor
vim.opt.splitbelow = true -- Split below the current window
vim.opt.splitright = true -- Split right of the current window

-- File
vim.opt.autoread = true -- Re-read file when it has been changed outside of vim
vim.opt.autowrite = true -- Automatically write file on some commands (like :make, :next...)
vim.opt.hidden = true -- Keeps buffers hidden when closed
vim.opt.backup = false
vim.opt.swapfile = false
-- vim.filetype.add = ({
-- 	extension = {
-- 		h = "c"
-- 	}
-- })

-- Miscellaneaous
vim.opt.mouse = a -- Enable mouse support
vim.opt.list = false -- Enable listchars
-- vim.opt.listchars = { tab = "»·", trail = "¤" } -- Indicators for invisible characters

-- Autocmd
-- vim.api.nvim_create_autocmd("BufWritePre", { pattern = "*", command = [[%s/\s\+$//e"]]})

-- Functionnalities
-- vim.opt.foldmethod = "syntax"
vim.opt.clipboard = "unnamedplus"

-- Keybinds
vim.g.mapleader = ' '

vim.keymap.set('n', '<C-t>', ':NvimTreeToggle <CR>', {silent = true, noremap = true})

-- Kitty autocommands to change padding/background when entering Neovim
local kitty_mp = vim.api.nvim_create_augroup("kitty_mp", { clear = true })
 
vim.api.nvim_create_autocmd({ "VimEnter" }, { pattern = { "*" }, command = "sil !kitty @ --to=$KITTY_LISTEN_ON set-background-opacity 1.0 ", group = kitty_mp})
vim.api.nvim_create_autocmd({ "VimEnter" }, { pattern = { "*" }, command = "sil !kitty @ --to=$KITTY_LISTEN_ON set-spacing padding=0 margin=0", group = kitty_mp})
vim.api.nvim_create_autocmd({ "VimEnter" }, { pattern = { "*" }, command = "sil !kitty @ --to=$KITTY_LISTEN_ON set-colors background=\\#1F2430", group = kitty_mp})
 
vim.api.nvim_create_autocmd({ "VimLeave" }, { pattern = { "*" }, command = "sil !kitty @ --to=$KITTY_LISTEN_ON set-spacing padding=default margin=default", group = kitty_mp })
vim.api.nvim_create_autocmd({ "VimLeave" }, { pattern = { "*" }, command = "sil !kitty @ --to=$KITTY_LISTEN_ON set-colors ~/.config/kitty/current-theme.conf", group = kitty_mp})
vim.api.nvim_create_autocmd({ "VimLeave" }, { pattern = { "*" }, command = "sil !kitty @ --to=$KITTY_LISTEN_ON set-background-opacity 0.8 ", group = kitty_mp})

-- Trying some stuff with personnalizing makeprg
-- vim.cmd([[set makeprg=cmake\ -S\ .\ -B\ build\ &&\ cmake\ --build\ build]])
-- vim.keymap.set("n", "<leader><leader>r", "<cmd>!./build/raytracer<CR>")
