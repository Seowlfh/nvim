local ls = require "luasnip"
local types = require "luasnip.util.types"

ls.setup({
    -- Remember the last snippet so you can jump back if you made a mistake
    history = true,
    -- To allow for dynamic snippets
    update_events = { "TextChanged" , "TextChangedI"},
})

--
-- Keymaps
--

-- Expand
vim.keymap.set({ "i", "s" }, "<c-k>", function()
    if ls.expand_or_jumpable() then
        ls.expand_or_jump()
    end
end, { silent = true })

-- Jump backward
vim.keymap.set({ "i", "s" }, "<c-j>", function()
    if ls.jumpable(-1) then
        ls.jump(-1)
    end
end, { silent = true })

-- Cycle through choices
vim.keymap.set( "i" , "<c-l>", function()
    if ls.choice_active() then
        ls.change_choice(-1)
    end
end)

-- Reload luasnip
vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/lua/plugins/luasnip.lua<CR>")


for _, lang in pairs({"nix", "lua", "c"}) do
    ls.add_snippets(lang, require("plugins.luasnip." .. lang))
end

ls.add_snippets("cpp", require("plugins.luasnip.c"))


