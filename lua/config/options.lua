local o = vim.opt

-- Indentation
o.tabstop = 8 -- Tab size
o.shiftwidth = 4 -- Indent size
o.expandtab = true -- Use spaces instead of tabs
o.smartindent = true

-- Search
o.incsearch = true -- Highlight matches while typing search query
o.hlsearch = false -- Highlight previous search matches
o.ignorecase = true -- Ignore case when searching
o.smartcase = true -- Case sensitive search if the query contains upper case letters

-- Interface
o.number = true
o.relativenumber = true
o.colorcolumn = "80" -- Highlight column 80
o.cursorline = true -- Highlight current line
o.signcolumn = "yes"
o.sidescrolloff = 8
o.scrolloff = 10 -- Always keep 10 line visible above or under the cursor
o.termguicolors = true
o.showmode = false -- Display keystrokes
o.showcmd = true -- Show command while typing
o.laststatus = 2 -- Always show status bar
o.wildmenu = true -- Better tab completion while typing commands
o.splitbelow = true -- Split below the current window
o.splitright = true -- Split right of the current window
o.wrap = false
o.pumheight = 10 -- Maximum height of pop-up menu for completion
o.conceallevel = 2 -- Completely hide concealed text (text between **, etc.)

-- Editing
o.iskeyword:append("-") -- Treat dash as part of word
o.path:append("**") -- include subdirectories in search
o.virtualedit = "block"
o.updatetime = 300
o.timeoutlen = 300
o.ttimeoutlen = 0
o.shiftround = true

-- File
o.autoread = true -- Re-read file when it has been changed outside of vim
o.autowrite = true -- Automatically write file on some commands (like :make, :next...)
o.hidden = true -- Keeps buffers hidden when closed
o.backup = false
o.swapfile = false
o.writebackup = false
o.undofile = true

-- Miscellaneaous
o.list = true -- Enable listchars
o.listchars = { tab = "➞ ", trail = "·" } -- Indicators for invisible characters

-- TODO: Trying to learn cliboard
-- o.clipboard = "unnamedplus"

-- Automatic linebreak
o.textwidth = 80
o.formatoptions:append({ "t" })
o.linebreak = true
