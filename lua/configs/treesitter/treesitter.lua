local treesitter = require 'nvim-treesitter'
local ensure_installed = require 'configs.treesitter.langs'

treesitter.install(ensure_installed)
