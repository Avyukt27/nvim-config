return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('bufferline').setup {}
    vim.keymap.set('n', '<leader>bn', function()
      Snacks.bufnext()
    end, { noremap = true, silent = true })
    vim.keymap.set('n', '<leader>bp', function()
      Snacks.bufprev()
    end, { noremap = true, silent = true })
    vim.keymap.set('n', '<leader>bd', function()
      Snacks.bufdelete()
    end, { noremap = true, silent = true })
  end,
}
