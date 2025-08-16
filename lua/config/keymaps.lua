-- Keybinds
vim.g.mapleader = " "

-- Easier movement accros  buffers
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Move through tabs
vim.keymap.set("n", "<S-h>", "<Cmd>tabprevious<CR>")
vim.keymap.set("n", "<S-l>", "<Cmd>tabnext<CR>")

-- NvimTree
vim.keymap.set("n", "<leader>ot", ":NvimTreeToggle <CR>", { silent = true, noremap = true })

-- Toggleterm
vim.keymap.set("t", "<ESC>", [[<C-\><C-n>]])
vim.keymap.set("n", "<leader>th", ":ToggleTerm direction=horizontal<CR>")
vim.keymap.set("n", "<leader>tv", ":ToggleTerm size=70 direction=vertical<CR>")

-- Edit dotfiles
vim.keymap.set("n", "<leader>ev", ":Telescope find_files cwd=$HOME/.config/nvim<CR>")
vim.keymap.set("n", "<leader>eh", ":Telescope find_files cwd=$HOME/.config/home-manager<CR>")

-- Resize
vim.keymap.set("n", "<C-Up>", "<Cmd> resize +5<CR>")
vim.keymap.set("n", "<C-Down>", "<Cmd> resize -5<CR>")
vim.keymap.set("n", "<C-Left>", "<Cmd> vertical resize +5<CR>")
vim.keymap.set("n", "<C-Right>", "<Cmd> vertical resize -5<CR>")
vim.keymap.set("n", "<C-r>", "<C-W>=")

-- Selection
vim.keymap.set("n", "gs", ":%s/\\<<C-r><C-w>\\>//g<Left><Left>", { desc = "replace word under cursor" })
vim.keymap.set("x", "gs", 'y:%s/\\V<C-r>"//g<Left><Left>', { desc = "replace selection" })
