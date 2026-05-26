return {
  'saghen/blink.cmp',
  event = 'VimEnter',
  version = '1.*',
  dependencies = {
    'L3MON4D3/LuaSnip',
    'folke/lazydev.nvim',
  },
  --- @module 'blink.cmp'
  --- @type blink.cmp.Config
  opts = {
    keymap = {
      preset = 'default',
    },
    appearance = {
      nerd_font_variant = 'mono',
    },
    completion = {
      menu = {
        border = 'single',
        draw = {
          columns = {
            { 'label',     'label_description', gap = 1 },
            { 'kind_icon', 'kind',              gap = 1 },
          },
        },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
        window = { border = 'single' },
      },
    },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'lazydev', 'vimtex' },
      providers = {
        lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
        vimtex = {
          module = 'blink.compat.source',
          name = 'vimtex',
        },
      },
    },
    snippets = { preset = 'luasnip' },
    fuzzy = { implementation = 'lua' },
    signature = {
      enabled = true,
      window = { border = 'single' },
    },
  },
}
