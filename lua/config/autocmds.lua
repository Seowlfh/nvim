-- Filetypes
vim.filetype.add({
    filename = {
        -- Pattern priority ???
        ["docker-compose.yaml"] = "yaml.docker-compose",
        ["docker-compose.yml"] = "yaml.docker-compose",
        ["compose.yaml"] = "yaml.docker-compose",
        ["compose.yml"] = "yaml.docker-compose",
    },
})

vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("close_with_q", {}),
    pattern = { "toggleterm", "help" },
    callback = function()
        vim.opt_local.buflisted = false
        vim.keymap.set("n", "q", "<Cmd>close<CR>", { buffer = 0 })
    end,
})

-- Kitty autocommands to change padding/background when entering Neovim
local kitty_mp = vim.api.nvim_create_augroup("kitty_mp", { clear = true })

vim.api.nvim_create_autocmd(
    { "VimEnter" },
    { pattern = { "*" }, command = "sil !kitty @ --to=$KITTY_LISTEN_ON set-background-opacity 1.0 ", group = kitty_mp }
)
vim.api.nvim_create_autocmd({ "VimEnter" }, {
    pattern = { "*" },
    command = "sil !kitty @ --to=$KITTY_LISTEN_ON set-spacing padding=0 margin=0",
    group = kitty_mp,
})
vim.api.nvim_create_autocmd({ "VimEnter" }, {
    pattern = { "*" },
    command = "sil !kitty @ --to=$KITTY_LISTEN_ON set-colors background=\\#1F2430",
    group = kitty_mp,
})

vim.api.nvim_create_autocmd({ "VimLeave" }, {
    pattern = { "*" },
    command = "sil !kitty @ --to=$KITTY_LISTEN_ON set-spacing padding=default margin=default",
    group = kitty_mp,
})
vim.api.nvim_create_autocmd({ "VimLeave" }, {
    pattern = { "*" },
    command = "sil !kitty @ --to=$KITTY_LISTEN_ON set-colors ~/.config/kitty/current-theme.conf",
    group = kitty_mp,
})
vim.api.nvim_create_autocmd(
    { "VimLeave" },
    { pattern = { "*" }, command = "sil !kitty @ --to=$KITTY_LISTEN_ON set-background-opacity 0.8 ", group = kitty_mp }
)
