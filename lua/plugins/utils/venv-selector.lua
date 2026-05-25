return {
  'linux-cultist/venv-selector.nvim',
  branch = 'main',
  dependencies = {
    'neovim/nvim-lspconfig',
    'nvim-telescope/telescope.nvim',
    'mfussenegger/nvim-dap-python',
  },
  opts = {
    name = '.venv',
    notify_user_on_activate = true,
  },
  keys = {
    { '<leader>vs', '<cmd>VenvSelect<cr>',       desc = 'Select VirtualEnv' },
    { '<leader>vc', '<cmd>VenvSelectCached<cr>', desc = 'Use Cached VirtualEnv' },
  },
  event = 'VeryLazy',
}
