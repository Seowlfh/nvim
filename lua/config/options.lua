-- Indentation
vim.opt.tabstop = 8       -- Tab size
vim.opt.shiftwidth = 4    -- Indent size
vim.opt.expandtab = true -- Use spaces instead of tabs

-- Search
vim.opt.incsearch = true  -- Highlight matches while typing search query
vim.opt.hlsearch = false  -- Highlight previous search matches
vim.opt.ignorecase = true -- Ignore case when searching
vim.opt.smartcase = true  -- Case sensitive search if the query contains upper case letters

-- Interface
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.colorcolumn = "80" -- Highlight column 80
vim.opt.cursorline = true  -- Highlight current line
vim.opt.scrolloff = 10
vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true
vim.opt.showmode = false  -- Display keystrokes
vim.opt.showcmd = true    -- Show command while typing
vim.opt.laststatus = 2    -- Always show status bar
vim.opt.wildmenu = true   -- Better tab completion while typing commands
vim.opt.scrolloff = 10    -- Always keep 10 line visiblie above or under the cursor
vim.opt.splitbelow = true -- Split below the current window
vim.opt.splitright = true -- Split right of the current window
vim.opt.wrap = false

-- File
vim.opt.autoread = true  -- Re-read file when it has been changed outside of vim
vim.opt.autowrite = true -- Automatically write file on some commands (like :make, :next...)
vim.opt.hidden = true    -- Keeps buffers hidden when closed
vim.opt.backup = false
vim.opt.swapfile = false

-- Miscellaneaous
vim.opt.mouse = a -- Enable mouse support
vim.opt.list = true -- Enable listchars
vim.opt.listchars = { tab = "➞ ", trail = "·" } -- Indicators for invisible characters

vim.opt.clipboard = "unnamedplus"
