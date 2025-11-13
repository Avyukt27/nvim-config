local capabilities = require('blink-cmp').get_lsp_capabilities()

return {
  clangd = {
    root_dir = require('lspconfig.util').root_pattern 'CMakeLists.txt',
    cmd = { 'clangd' },
    filetypes = { 'c', 'cpp' },
    capabilities = capabilities,
  },

  basedpyright = {
    root_dir = require('lspconfig.util').root_pattern('pyproject.toml', '.git'),
    settings = {
      basedpyright = {
        analysis = {
          diagnosticMode = 'workspace',
          typeCheckingMode = 'off',
        },
      },
    },
    capabilities = capabilities,
  },

  lua_ls = {
    root_dir = require('lspconfig.util').root_pattern('lua', '.git'),
    settings = {
      Lua = {
        completion = {
          callSnippet = 'Replace',
        },
      },
    },
    capabilities = capabilities,
  },

  fortls = {
    root_dir = require('lspconfig.util').root_pattern('fort.ros', '.git'),
    capabilities = capabilities,
  },

  asm_lsp = {
    command = { 'asm-lsp' },
  },
}
