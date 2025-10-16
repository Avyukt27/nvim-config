return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('bufferline').setup {}
    vim.keymap.set('n', '<leader>bn', ':bnext<CR>', { noremap = true, silent = true })
    vim.keymap.set('n', '<leader>bp', ':bprev<CR>', { noremap = true, silent = true })
    vim.keymap.set('n', '<leader>bd', ':bdelete<CR>', { noremap = true, silent = true })
  end,
}
