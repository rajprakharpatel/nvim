_G.STime = vim.fn.localtime()
------------------------------------------------------------------------
--                              modules                               --
------------------------------------------------------------------------

-- util
require "util"

-- options
require "options"

-- Keymaps
require "keymaps"

-- plugins
require "plugin.config"

-- Lsp
-- require "lsp"

vim.cmd [[colo material]]
