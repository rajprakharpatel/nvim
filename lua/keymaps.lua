local map = vim.api.nvim_set_keymap
-- vim.g.mapleader = '\\'

-- no hl
map("n", "<leader>h", ":nohl<cr>", { noremap = true, silent = true })

-- explorer
vim.api.nvim_set_keymap(
	"n",
	"<space>e",
	":NvimTreeToggle<CR>",
	{ noremap = true, silent = true }
)

-- To use `ALT+{h,j,k,l}`  to navigate windowsfrom any mode:
-- better window movement
map("n", "<a-h>", "<C-w>h", { silent = true })
map("n", "<a-j>", "<C-w>j", { silent = true })
map("n", "<a-k>", "<C-w>k", { silent = true })
map("n", "<a-l>", "<C-w>l", { silent = true })

vim.cmd [[
tnoremap <a-h> <C-\><C-N><C-w>h
tnoremap <a-j> <C-\><C-N><C-w>j
tnoremap <a-k> <C-\><C-N><C-w>k
tnoremap <a-l> <C-\><C-N><C-w>l
inoremap <a-h> <C-\><C-N><C-w>h
inoremap <a-j> <C-\><C-N><C-w>j
inoremap <a-k> <C-\><C-N><C-w>k
inoremap <a-l> <C-\><C-N><C-w>l
]]

-- resize with arrows
vim.cmd [[
  nnoremap <silent> <C-Up>    :resize -2<CR>
  nnoremap <silent> <C-Down>  :resize +2<CR>
  nnoremap <silent> <C-Left>  :vertical resize -2<CR>
  nnoremap <silent> <C-Right> :vertical resize +2<CR>
]]

-- better indenting
vim.api.nvim_set_keymap("v", "<", "<gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", ">", ">gv", { noremap = true, silent = true })

-- Tab switch buffer
vim.api.nvim_set_keymap(
	"n",
	"<TAB>",
	":BufferLineCycleNext<CR>",
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<S-TAB>",
	":BufferLineCyclePrev<CR>",
	{ noremap = true, silent = true }
)
map("n", "gb", "<cmd>BufferLinePick<CR>", { noremap = true, silent = true })
map(
	"n",
	"bd",
	"<cmd>BufferLinePickClose<CR>",
	{ noremap = true, silent = true }
)
map(
	"n",
	"<leader>1",
	"<cmd>BufferLineGoToBuffer 1<CR>",
	{ noremap = true, silent = true }
)
map(
	"n",
	"<leader>2",
	"<cmd>BufferLineGoToBuffer 2<CR>",
	{ noremap = true, silent = true }
)
map(
	"n",
	"<leader>3",
	"<cmd>BufferLineGoToBuffer 3<CR>",
	{ noremap = true, silent = true }
)
map(
	"n",
	"<leader>4",
	"<cmd>BufferLineGoToBuffer 4<CR>",
	{ noremap = true, silent = true }
)
map(
	"n",
	"<leader>5",
	"<cmd>BufferLineGoToBuffer 5<CR>",
	{ noremap = true, silent = true }
)
map(
	"n",
	"<leader>6",
	"<cmd>BufferLineGoToBuffer 6<CR>",
	{ noremap = true, silent = true }
)
map(
	"n",
	"<leader>7",
	"<cmd>BufferLineGoToBuffer 7<CR>",
	{ noremap = true, silent = true }
)
map(
	"n",
	"<leader>8",
	"<cmd>BufferLineGoToBuffer 8<CR>",
	{ noremap = true, silent = true }
)
map(
	"n",
	"<leader>9",
	"<cmd>BufferLineGoToBuffer 9<CR>",
	{ noremap = true, silent = true }
)

-- Quick searh syntax
map("c", ";;", "%s:::g<Left><Left><Left>", { noremap = true })
-- Quick mapping to put \(\) in your pattern string
map("c", ";\\", "\\ \\(\\)<Left><Left>", { noremap = true })

-- Edit vimrc configuration file
map("n", "<Leader>ve", ":e $MYVIMRC<cr>", { noremap = true })
-- Reload vimrc configuration file
map("n", "<leader>vr", ":luafile $MYVIMRC<CR>", { noremap = true })
-- Reload current luafile
map("n", "<leader>lr", ":luafile %<cr>", { noremap = true })
-- Run current line as a command with '\e'
map("n", "<leader>e", ":exe getline(line('.'))<CR>", { noremap = true })
-- CDF = Change to Directory of Current file
vim.cmd "command! CDF cd %:p:h"
-- refresh external changes into file
map("n", "<F5>", ":checktime<CR>", { noremap = true })
-- Quit without closing tab
vim.cmd "command! Q :Sayonara!"
-- Add semicolon to end of line with <;>
map("n", ";", "A;<esc>", { noremap = true })
-- clear quickfixlist
vim.cmd "command! ClearQuickfixList cexpr []"
map("n", "<leader>cf", "<cmd>ClearQuickfixList<CR>", { noremap = true })

-- CommentToggle
-- map('n', '<c-/>', '<cmd>Commentary<cr>', {noremap = true})
map("n", "<c-_>", "<cmd>Commentary<cr>", { noremap = true })

-- ctrl-s save
map("n", "<c-s>", "<esc>:w!<cr>", { noremap = true })
map("i", "<c-s>", "<esc>:w!<cr>a", { noremap = true })

-- Control-C Copy to system clipboard
map("v", "<c-c>", '"+y', { noremap = true })
map("n", "<c-c>", '"+yy', { noremap = true })
map("i", "<c-c>", '<esc>"+yya', { noremap = true })

-- Replace selected text with system clipboard content
map("v", "<c-v>", '"+p', { noremap = true })
-- paste last yank in commad mode not system clipboard
map("c", "<c-v>", "<c-r>0", { noremap = true })
map("i", "<c-v>", "<c-r>0", { noremap = true })

-- Toggle Transparency of background
map(
	"",
	"<leader>tr",
	":hi Normal guibg=NONE ctermbg=NONE <bar> :set nocursorline <bar> :set colorcolumn=0<CR>",
	{ noremap = true }
)
map(
	"",
	"<leader>op",
	":set background=dark <bar> :set cursorline <bar> :set colorcolumn=80<CR>",
	{ noremap = true }
)

-- Pack Install
local pre_cmd = "<cmd>source "
	.. vim.fn.stdpath "config"
	.. "/lua/plugins.lua | "
map("n", "<leader>pi", pre_cmd .. "PackerInstall<cr>", { noremap = true })
map("n", "<leader>ps", pre_cmd .. "PackerSync<cr>", { noremap = true })
map("n", "<leader>pc", pre_cmd .. "PackerClean<cr>", { noremap = true })

-- Symbols Outline
map("n", "<F9>", ":SymbolsOutline<CR>", { noremap = true })

-- Behave Vim
map("n", "Y", "y$", { noremap = true })

-- Keeping it centered
map("n", "n", "nzzzv", { noremap = true })
map("n", "N", "Nzzzv", { noremap = true })
map("n", "J", "mzJ`z", { noremap = true })

-- Undo break points
map("i", ",", ",<c-g>u", { noremap = true })
map("i", ".", ".<c-g>u", { noremap = true })
map("i", "!", "!<c-g>u", { noremap = true })
map("i", "?", "?<c-g>u", { noremap = true })

-- Jumplist mutations
vim.cmd [[nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k']]
vim.cmd [[nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j']]

-- Code Runner
vim.cmd [[
augroup code
    autocmd!
  autocmd filetype cpp nmap <F6> :w <bar> Dispatch! g++ -s -O3 % -o release-%:r && ./release-%:r < inp > out <CR>
  autocmd filetype cpp nmap <F18> :w <bar> FloatermNew! g++ -ulimit -ggdb -Og -Wall -Wno-unused-result -std=c++20 % -o debug-%:r && ./debug-%:r < inp > out <CR>
  autocmd filetype c nmap <F6> :w <bar> Dispatch! gcc % -o %:r && ./%:r < inp > out <CR>
  autocmd filetype c nmap <F18> :w <bar> FloatermNew! gcc -g  % -o %:r && ./%:r < inp > out <CR>
  autocmd filetype java nmap <F6> :w <bar> Dispatch! javac -g % && java -enableassertions %:r < inp > out <CR>
  " to start debug server on port 5005
  autocmd filetype java nmap <F18> :w <bar> FloatermNew! java -Xdebug -Xrunjdwp:server=y,transport=dt_socket,address=5005,suspend=y %:r
  autocmd filetype python nmap <F6> :w <bar> Dispatch! python % < inp > out <CR>
  autocmd filetype python nmap <F18> :w <bar> Dispatch! alacritty --hold -e python % <CR>
augroup END
]]

-- Org Notes
-- map("n", "<space>n", ":e ~/org/notes.org<CR>", { noremap = true })

-- Neomux
map("n", "<space>tt", "<cmd>Neomux<CR>", { noremap = true })

-- Neoclip
map(
	"n",
	"<space>'",
	"<cmd> lua require('telescope').extensions.neoclip.default()<CR>",
	{ noremap = true }
)

-- change split orientation
map("n", "<space><s-h>", "<C-w>t<C-w>K", { noremap = true })
map("n", "<space><s-k>", "<C-w>t<C-w>H", { noremap = true })
map("n", "<m-v>", "<cmd>vsplit<cr>", { noremap = true })
map("n", "<m-s>", "<cmd>split<cr>", { noremap = true })
map("n", "<m-q>", "<cmd>quit<cr>", { noremap = true })

-- telescope
map("n", "<space>tf", "<cmd>Telescope find_files<CR>", { noremap = true })

-- miscellaneous
map("i", "<C-u>", "<esc>mzgUiw`za", { noremap = true })
