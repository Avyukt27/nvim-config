local opts = { expr = true, silent = true }

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('i', '<C-u>', '', opts)
vim.keymap.set('n', '<C-Right>', '"e"', opts)
vim.keymap.set('n', '<C-Left>', '"ge"', opts)
vim.keymap.set('i', '<C-Right>', '"<C-o>w"', opts)
vim.keymap.set('i', '<C-Left>', '"<C-o>b"', opts)
vim.keymap.set('i', '<C-BS>', '"<C-o>db"', opts)
vim.keymap.set('i', '<C-Del>', '"<C-o>dw"', opts)

vim.keymap.set('n', '<leader>lp', function()
  local current_file = vim.fn.expand '%:p'
  local project_dir = vim.fn.expand '%:p:h'
  local pdf_file = vim.fn.expand '%:p:r' .. '.pdf'

  vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
    pattern = { 'main.tex', '*/sections/*.tex' },
    callback = function()
      if vim.bo.modified then
        vim.cmd 'silent! write'
      end
    end,
  })

  vim.fn.jobstart({
    'latexmk',
    '-pvc',
    '-pdf',
    '-interaction=nonstopmode',
    current_file,
  }, { cwd = project_dir })

  vim.defer_fn(function()
    vim.fn.jobstart({ 'zathura', pdf_file }, { detach = true })
  end, 1000)
end, { desc = 'Start Live LaTeX Preview' })

vim.keymap.set('n', 'gn', vim.lsp.buf.rename, { desc = 'Rename symbol' })

vim.keymap.set('n', '<leader>re', '<cmd>restart<cr>')
