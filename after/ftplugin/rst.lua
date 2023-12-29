vim.bo.makeprg = 'nix build .\\#workflows.x86_64-linux.cmake.documents.subject.pdf'

vim.keymap.set('n', '<leader>co', '<cmd>make<cr>')
