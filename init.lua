_G.STime = vim.fn.localtime()
------------------------------------------------------------------------
--                              modules                               --
------------------------------------------------------------------------

-- util
require "util"

-- options
vim.cmd "colo gruvbox"
require "options"

-- Keymaps
require "keymaps"

-- plugins
require "plugin.config"

-- Lsp
-- require "lsp"
