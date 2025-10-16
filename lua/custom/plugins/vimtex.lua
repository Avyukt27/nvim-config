return {
  'lervag/vimtex',
  ft = { 'latex', 'tex' },
  config = function()
    vim.g.vimtex_view_method = 'zathura'
    vim.g.vimtex_compiler_method = 'latexmk'
    vim.g.vimtex_quickfix_mode = 0
    vim.g.vimtex_compiler_latexmk = {
      build_dir = 'build',
      options = {
        '-pdf',
        '-interaction=nonstopmode',
        '-synctex=1',
      },
    }
  end,
}
