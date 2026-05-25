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
        disableOrganizeImports = true,
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
    filetypes = { 'asm', 's' },
  },

  tailwindcss = {},

  arduino_language_server = {
    cmd = {
      'arduino-language-server',
      '-cli',
      '/usr/bin/arduino-cli',
      '-cli-config',
      os.getenv 'HOME' .. '/.arduino15/arduino-cli.yaml',
      '-clangd',
      os.getenv 'HOME' .. '/.local/share/nvim/mason/bin/clangd',
      '-fqbn',
      'arduino:avr:uno',
    },
    root_dir = require('lspconfig.util').root_pattern('sketch.yaml', '*.ino'),
  },

  ts_ls = {
    filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
    init_options = {
      plugins = {
        {
          name = '@vue/typescript-plugin',
          location = vim.fn.stdpath 'data' .. '/mason/packages/vue-language-server/node_modules/@vue/language-server',
          languages = { 'vue' },
        },
      },
    },
  },

  vue_ls = {},
}
