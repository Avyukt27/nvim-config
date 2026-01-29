return {
  {
    'micangl/cmp-vimtex',
    ft = 'tex',
    config = function()
      require('cmp_vimtex').setup {}
    end,
  },
  {
    'saghen/blink.compat',
    version = '*',
    opts = { impersonate_nvim_cmp = false },
  },
}
