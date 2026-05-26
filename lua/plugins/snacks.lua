return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    lazygit = { enabled = true },
    bigfile = { enabled = true },
    dashboard = require 'configs.snacks.dashboard',
    indent = { enabled = false },
    input = { enabled = true },
    notifier = {
      enabled = true,
      timeout = 5000,
    },
    picker = require 'configs.snacks.picker',
    gh = { enabled = true },
    explorer = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = require 'configs.snacks.statusline',
    words = { enabled = false },
    styles = {
      notification = {
        wo = { wrap = true },
      },
    },
    toggle = { enabled = true },
  },
  keys = require 'configs.snacks.keybinds',
  init = function()
    vim.api.nvim_create_autocmd('User', {
      pattern = 'VeryLazy',
      callback = function()
        _G.dd = function(...)
          Snacks.debug.inspect(...)
        end
        _G.bt = function()
          Snacks.debug.backtrace()
        end

        if vim.fn.has 'nvim-0.11' == 1 then
          vim._print = function(_, ...)
            dd(...)
          end
        else
          vim.print = _G.dd
        end

        require 'configs.snacks.toggle-keybinds'
      end,
    })
  end,
}
