vim.keymap.set('n', '<leader>tt', ':NvimTreeToggle<CR>')
vim.keymap.set("n", "]g", vim.diagnostic.goto_next)
vim.keymap.set("n", "[g", vim.diagnostic.goto_prev)

vim.keymap.set("n", "<leader>bd", ':bn | bd#<CR>')
