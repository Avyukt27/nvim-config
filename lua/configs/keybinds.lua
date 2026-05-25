local opts = { expr = true, silent = true }

vim.keymap.set('i', '<C-u>', '', opts)
vim.keymap.set('n', '<C-Right>', '"e"', opts)
vim.keymap.set('n', '<C-Left>', '"ge"', opts)
vim.keymap.set('i', '<C-Right>', '"<C-o>w"', opts)
vim.keymap.set('i', '<C-Left>', '"<C-o>b"', opts)
vim.keymap.set('i', '<C-BS>', '"<C-o>db"', opts)
vim.keymap.set('i', '<C-Del>', '"<C-o>dw"', opts)
vim.keymap.set('i', '<C-x>', function()
  vim.notify('mathzone = ' .. vim.api.nvim_eval 'vimtex#syntax#in_mathzone()')
end, opts)
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
