------------------------------------------------------------------------
--                              options                               --
------------------------------------------------------------------------

-- Do not source default filtype.(vim/lua)
-- vim.g.did_load_filetypes = 1

vim.cmd [[let $GIT_EDITOR = 'nvr -cc split --remote-wait']]
vim.cmd [[set comments=sl:/*,mb:\ *,elx:\ */]]
-- vim.cmd([[colo material]])
vim.cmd [[set guifont=SauceCodePro\ Nerd\ Font:h11]]
vim.cmd "set iskeyword+=-"
vim.cmd [[set nu]]
vim.cmd [[set rnu]]
vim.o.viewoptions = "cursor,folds,slash,unix"
vim.o.scrolloff = 4
vim.o.sidescrolloff = 9
vim.wo.signcolumn = "yes"
vim.o.conceallevel = 0
vim.o.updatetime = 700 -- Faster completion
vim.o.timeoutlen = 500 -- By default timeoutlen is 1000 ms
vim.o.updatetime = 700
vim.o.enc = "utf-8"
vim.o.fenc = "utf-8"
vim.o.swapfile = false
vim.o.backup = false
vim.o.hidden = true
vim.o.showmode = false
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.incsearch = true
vim.o.lazyredraw = true
vim.o.autoindent = true
vim.bo.smartindent = true
vim.wo.wrap = false
vim.o.textwidth = 79
vim.go.t_Co = "256"
vim.o.syntax = "true"
vim.o.showmatch = true
vim.o.whichwrap = vim.o.whichwrap .. "<,>,[,]"
vim.o.mouse = vim.o.mouse .. "a"
vim.o.showtabline = 2
vim.wo.colorcolumn = "80"
vim.wo.cursorline = true
vim.o.laststatus = 3

vim.o.secure = true
vim.o.title = true
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.modeline = false
vim.o.ttimeout = true
vim.o.wildignorecase = true
vim.o.shiftround = true
vim.o.magic = true
vim.o.expandtab = true
vim.o.tags = "" -- let gutentags handle this

vim.o.ttimeoutlen = 20
vim.bo.shiftwidth = 2
vim.o.shiftwidth = 2
vim.bo.softtabstop = 2
vim.o.softtabstop = 2
vim.bo.tabstop = 2
vim.o.tabstop = 2
vim.o.synmaxcol = 200
vim.o.conceallevel = 2
-- vim.o.cscopetagorder = 0
-- vim.o.cscopepathcomp = 3
vim.o.showbreak = string.rep(" ", 3) -- Make it so that long lines wrap smartly

vim.bo.undofile = true
vim.o.undofile = true
vim.o.undodir = vim.fn.stdpath "data" .. "/shada/undo-dir"
vim.o.foldopen = "search"
-- vim.o.fileformat = 'unix'
vim.o.jumpoptions = "stack"
vim.o.diffopt = "hiddenoff,iwhiteall,algorithm:patience"
vim.o.nrformats = "bin,hex,alpha"
vim.o.grepprg = "rg --smart-case --vimgrep --block-buffered"
vim.o.virtualedit = "block"
vim.o.inccommand = "nosplit"
-- vim.o.cscopequickfix = "s-,c-,d-,i-,t-,e-"
vim.o.path = ".,,,**"
vim.o.completeopt = "menuone,noselect"
vim.o.list = true
vim.o.listchars = "tab:░░,trail:-,space: ,extends:»,precedes:«,nbsp:⣿"
-- vim.o.listchars = "tab:  ,trail:-,space:░,extends:»,precedes:«,nbsp:⣿"
vim.o.formatlistpat =
"^\\s*\\[({]\\?\\([0-9]\\+\\|[a-zA-Z]\\+\\)[\\]:.)}]\\s\\+\\|^\\s*[-–+o*•]\\s\\+"
-- vim.o.foldlevelstart = 0
-- vim.wo.foldmethod = "indent"
vim.o.foldenable = false
vim.o.wildignore =
"*/dist*/*,*/target/*,*/builds/*,*/node_modules/*,*/flow-typed/*,*.png,*.PNG,*.jpg,*.jpeg,*.JPG,*.JPEG,*.pdf,*.exe,*.o,*.obj,*.dll,*.DS_Store,*.ttf,*.otf,*.woff,*.woff2,*.eot"
vim.o.shortmess = vim.o.shortmess .. "s"
vim.cmd [[
set ssop-=options    " do not store global and local values in a session
set ssop-=folds      " do not store folds
]]
-- UI OPTS
vim.o.termguicolors = true
vim.o.fillchars = "stlnc:»,vert:║,fold:·,diff:/"
vim.o.pumblend = 20
vim.o.pumheight = 15
vim.o.guicursor = "n:blinkwait60-blinkon175-blinkoff175,i-ci-ve:ver25"
vim.o.signcolumn = "yes"
vim.o.mousemoveevent = true
-- vim.o.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
if vim.fn.has("nvim-0.9.0") == 1 then
	vim.o.splitkeep = "screen"
end

-- python path
vim.g.python3_host_prog = "/opt/homebrew/bin/python3"

--------------------------------------------------------------------------------
--                                 autocmd!                                   --
--------------------------------------------------------------------------------
local au = vim.api.nvim_create_autocmd

local _relNum = vim.api.nvim_create_augroup("_relNum", { clear = true })
au("InsertEnter", { command = "set norelativenumber", group = _relNum })
au("InsertLeave", { command = "set relativenumber", group = _relNum })

local _jdtls = vim.api.nvim_create_augroup("_jdtls", { clear = true })
au("FileType", {
	pattern = "java",
	command = "lua require('lsp.jdtls').setup()",
	group = _jdtls,
})

local _gitFiles = vim.api.nvim_create_augroup("_gitFiles", { clear = true })
au("FileType", {
	pattern = { "gitcommit", "gitrebase", "gitconfig" },
	command = "set bufhidden",
	group = _gitFiles,
})

local _astro = vim.api.nvim_create_augroup("_astro", { clear = true })
au({ "BufRead", "BufEnter" }, {
	pattern = { "*.astro" },
  command = "set ft=astro"
})
