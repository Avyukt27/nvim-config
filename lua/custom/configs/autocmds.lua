require('Arduino-Nvim.lsp').setup()

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'arduino',
  callback = function()
    require 'Arduino-Nvim'
  end,
})

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.rs',
  callback = function()
    vim.lsp.buf.format { async = false }
  end,
})

-- vim.api.nvim_create_autocmd('VimEnter', {
--   callback = function()
--     vim.cmd "lua require('snacks').dim()"
--   end,
-- })
