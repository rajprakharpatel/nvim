-- require 'tt.nvim_utils'
local set = vim.o


vim.cmd('source ~/.config/nvim/viml/init.vim') -- some settings not working in lua

set.secure          = true
set.title           = true
set.splitright      = true
set.modeline        = false
set.ttimeout        = true
set.wildignorecase  = true
set.shiftround      = true
set.magic           = true
set.expandtab       = true
set.tags            = "" -- let gutentags handle this

set.ttimeoutlen     = 20
set.shiftwidth      = 2
set.softtabstop     = 2
set.tabstop         = 2
set.synmaxcol       = 200
set.updatetime      = 200
set.conceallevel    = 2
set.cscopetagorder  = 0
set.cscopepathcomp  = 3
set.showbreak       = string.rep(' ', 3) -- Make it so that long lines wrap smartly

set.foldopen        = "search"
set.fileformat      = 'unix'
set.jumpoptions     = "stack"
set.diffopt         = "hiddenoff,iwhiteall,algorithm:patience"
set.nrformats       = "bin,hex,alpha"
set.grepprg         = "rg --smart-case --vimgrep --block-buffered"
set.virtualedit     = "block"
set.inccommand      = "split"
set.cscopequickfix  = "s-,c-,d-,i-,t-,e-"
set.path            = '.,,,**'
set.completeopt     = 'menuone,noselect'
set.listchars       = 'tab:░░,trail:·,space: ,extends:»,precedes:«,nbsp:⣿'
set.formatlistpat   = "^\\s*\\[({]\\?\\([0-9]\\+\\|[a-zA-Z]\\+\\)[\\]:.)}]\\s\\+\\|^\\s*[-–+o*•]\\s\\+"
set.foldlevelstart  = 99
set.foldmethod      = "syntax"
set.wildignore      = '*/dist*/*,*/target/*,*/builds/*,*/node_modules/*,*/flow-typed/*,*.png,*.PNG,*.jpg,*.jpeg,*.JPG,*.JPEG,*.pdf,*.exe,*.o,*.obj,*.dll,*.DS_Store,*.ttf,*.otf,*.woff,*.woff2,*.eot'
set.shortmess       = vim.o.shortmess .. 's'

-- UI OPTS
set.termguicolors  = true
set.fillchars      = "stlnc:»,vert:║,fold:·"
set.number         = true
set.pumblend       = 20
set.pumheight      = 15
set.guicursor      = "n:blinkwait60-blinkon175-blinkoff175,i-ci-ve:ver25"

function _G.dump(...)
    local objects = vim.tbl_map(vim.inspect, {...})
    print(unpack(objects))
end

require('keymaps')
require('plugins')
require('plugin-configs')
vim.cmd('source ~/.config/nvim/viml/inc_easy_fuzzy.vim')
require('nvim-compe')
require('nv-globals')
-- Lsp
require('lsp')
require('lsp.clangd')
require('lsp.lua-ls')
require('lsp.bash-ls')
require('lsp.js-ts-ls')
require('lsp.python-ls')
require('lsp.json-ls')
require('lsp.yaml-ls')
require('lsp.vim-ls')
require('lsp.graphql-ls')
require('lsp.css-ls')
require('lsp.docker-ls')
require('lsp.html-ls')
require('lsp.efm-general-ls')
require('lsp.virtual_text')
require('nv-galaxyline')


