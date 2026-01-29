local opts = { expr = true, silent = true }

vim.keymap.set('i', '<C-u>', '', opts)
vim.keymap.set('n', '<C-Right>', '"e"', opts)
vim.keymap.set('n', '<C-Left>', '"ge"', opts)
vim.keymap.set('i', '<C-Right>', '"<C-o>w"', opts)
vim.keymap.set('i', '<C-Left>', '"<C-o>b"', opts)
vim.keymap.set('i', '<C-BS>', '"<C-o>db"', opts)
vim.keymap.set('i', '<C-Del>', '"<C-o>dw"', opts)
