local null_ls = require 'null-ls'

return {
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
  null_ls.builtins.formatting.prettierd.with {
    filetypes = { 'javascript', 'typescript', 'vue', 'css', 'html', 'json' },
  },
}
