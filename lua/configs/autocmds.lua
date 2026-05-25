local servers = require 'configs.servers'
local capabilities = require('blink-cmp').get_lsp_capabilities()

local myAugrp = vim.api.nvim_create_augroup('myAutocmds', { clear = true })

vim.api.nvim_create_autocmd('BufWritePre', {
  group = myAugrp,
  pattern = '*.rs',
  callback = function()
    vim.lsp.buf.format { async = false }
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  group = myAugrp,
  pattern = 'vue',
  callback = function(args)
    local root_dir = vim.fs.root(args.buf, { 'package.json', 'tsconfig.json', 'jsconfig.json' })
    local init_options = vim.deepcopy(servers.ts_ls.init_options)
    local mason_path = vim.fn.stdpath 'data' .. '/mason/packages/vue-language-server/node_modules/@vue/language-server'
    if vim.fn.isdirectory(mason_path) == 1 then
      init_options.plugins[1].location = mason_path
    end

    vim.lsp.start {
      name = 'ts_ls',
      cmd = { 'typescript-language-server', '--stdio' },
      root_dir = root_dir,
      init_options = init_options,
      capabilities = capabilities,
    }
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  group = myAugrp,
  pattern = require 'configs.treesitter-langs',
  callback = function(args)
    local lang = vim.treesitter.language.get_lang(args.match)
    if lang then
      pcall(vim.treesitter.start, args.buf)
    end
  end,
})
