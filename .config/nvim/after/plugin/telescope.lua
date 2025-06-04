local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.grep_string, { desc = 'Ripgrep files' })
vim.keymap.set('n', '<leader>be', builtin.buffers, { desc = 'Browse buffers' })
