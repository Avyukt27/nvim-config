local null_ls = require 'null-ls'

return {
  require('none-ls.formatting.ruff').with { extra_args = { '--extend-select', 'I' } },
  require('none-ls.diagnostics.ruff').with { extra_args = { '--select', 'F,E,W,I,UP,B,N,A,PIE,C4,SIM,RET,ICN,TCH,ANN' } },
  require 'none-ls.formatting.ruff_format',
  null_ls.builtins.formatting.shfmt.with { extra_args = { '-i', '4' } },
  null_ls.builtins.formatting.stylua,
  null_ls.builtins.formatting.clang_format.with {
    filetypes = { 'c', 'cpp' },
    extra_args = { '--style={IndentWidth: 2, TabWidth: 2, UseTab: NEVER, ContinuationIndentWidth: 2}' },
  },
  null_ls.builtins.diagnostics.cppcheck.with {
    filetypes = { 'c', 'cpp' },
    args = { '--enable=warning,style,performance,portability', '--template=gcc', '--check-level=exhaustive', '$FILENAME' },
  },
  null_ls.builtins.formatting.fprettify,
  null_ls.builtins.formatting.google_java_format,
  null_ls.builtins.diagnostics.checkstyle.with { extra_args = { '-c', './checkstyle.xml' } },
}
