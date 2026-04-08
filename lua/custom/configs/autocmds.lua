vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.rs',
  callback = function()
    vim.lsp.buf.format { async = false }
  end,
})

vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = '*/NES/**/*.s',
  callback = function()
    vim.bo.filetype = 'asm_ca65'
  end,
})

vim.api.nvim_create_autocmd('VimEnter', {
  callback = function()
    Snacks.explorer()
  end,
})
