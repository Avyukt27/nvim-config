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

vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
  group = vim.api.nvim_create_augroup('eslint-fix-on-save', { clear = true }),
  pattern = { '*.js', '*.jsx', '*.ts', '*.tsx', '*.vue', '*.svelte' }, -- Add all relevant file types
  callback = function(args)
    vim.lsp.buf.format {
      bufnr = args.buf,
      async = false,
      filter = function(client)
        return client.name == 'eslint'
      end,
    }
  end,
})
