vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.rs',
  callback = function()
    vim.lsp.buf.format { async = false }
  end,
})

vim.api.nvim_create_autocmd('VimEnter', {
  callback = function()
    vim.cmd "lua require('snacks').toggle.inlay_hints():toggle()"
    vim.cmd "lua require('snacks').toggle.indent():toggle()"
  end,
})
