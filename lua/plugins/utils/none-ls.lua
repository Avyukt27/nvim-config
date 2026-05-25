return {
  'nvimtools/none-ls.nvim',
  dependencies = {
    'nvimtools/none-ls-extras.nvim',
    'jayp0521/mason-null-ls.nvim',
  },
  config = function()
    require('mason-null-ls').setup {
      ensure_installed = require 'configs.none-ls.ensure-installed',
      automatic_installation = true,
    }

    local null_ls = require 'null-ls'
    local sources = require 'configs.none-ls.sources'
    local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
    null_ls.setup {
      sources = sources,
      on_attach = function(client, bufnr)
        if client:supports_method 'textDocument/formatting' then
          vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
          vim.api.nvim_create_autocmd('BufWritePre', {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format {
                bufnr = bufnr,
                async = false,
                filter = function(f_client)
                  return f_client.name ~= 'basedpyright' and f_client.name ~= 'ts_ls' and f_client.name ~= 'vue_ls'
                end,
              }
            end,
          })
        end
      end,
    }
  end,
}
