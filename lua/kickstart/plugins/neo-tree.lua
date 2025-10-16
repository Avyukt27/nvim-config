-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- file icons
    'MunifTanjim/nui.nvim',
  },
  lazy = false,
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  opts = {
    filesystem = {
      window = {
        position = 'right',
        width = 35,
        preserve_window_proportions = false,
        mappings = {
          ['\\'] = 'close_window',
        },
      },
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
        hide_gitignore = false,
      },
      use_libuv_file_watcher = true,
    },
    default_component_configs = {
      icon = {
        folder_closed = '', -- Default closed folder icon
        folder_open = '', -- Default open folder icon
        -- You can also override other icons here if needed
      },
    },
  },
  override = {
    ['assets'] = {
      icon = '',
      color = '#E06C75',
      name = 'assets',
    },
  },
}
