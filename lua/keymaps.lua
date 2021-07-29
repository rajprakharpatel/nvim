local map = vim.api.nvim_set_keymap
-- vim.g.mapleader = '\\'

-- no hl
map('n', '<leader>h', ':nohl<cr>', {noremap = true, silent = true})

-- explorer
vim.api.nvim_set_keymap('n', '<space>e', ':NvimTreeToggle<CR>', {noremap = true, silent = true})

-- To use `ALT+{h,j,k,l}`  to navigate windowsfrom any mode:
-- better window movement
map('n', '<a-h>', '<C-w>h', {silent = true})
map('n', '<a-j>', '<C-w>j', {silent = true})
map('n', '<a-k>', '<C-w>k', {silent = true})
map('n', '<a-l>', '<C-w>l', {silent = true})

vim.cmd([[
tnoremap <a-h> <C-\><C-N><C-w>h
tnoremap <a-j> <C-\><C-N><C-w>j
tnoremap <a-k> <C-\><C-N><C-w>k
tnoremap <a-l> <C-\><C-N><C-w>l
inoremap <a-h> <C-\><C-N><C-w>h
inoremap <a-j> <C-\><C-N><C-w>j
inoremap <a-k> <C-\><C-N><C-w>k
inoremap <a-l> <C-\><C-N><C-w>l
]])

-- resize with arrows
vim.cmd([[
  nnoremap <silent> <C-Up>    :resize -2<CR>
  nnoremap <silent> <C-Down>  :resize +2<CR>
  nnoremap <silent> <C-Left>  :vertical resize -2<CR>
  nnoremap <silent> <C-Right> :vertical resize +2<CR>
]])

-- better indenting
vim.api.nvim_set_keymap('v', '<', '<gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '>', '>gv', {noremap = true, silent = true})

-- Tab switch buffer
vim.api.nvim_set_keymap('n', '<TAB>', ':bnext<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<S-TAB>', ':bprevious<CR>', {noremap = true, silent = true})

-- Quick searh syntax
map('c', ';;', '%s:::g<Left><Left><Left>', {noremap = true})
-- Quick mapping to put \(\) in your pattern string
map('c', ';\\', '\\ \\(\\)<Left><Left>', {noremap = true})

-- Edit vimrc configuration file
map('n', '<Leader>ve', ':e $MYVIMRC<cr>', {noremap = true})
-- Reload vimrc configuration file
map('n', '<leader>vr', ':luafile $MYVIMRC<CR>', {noremap = true})
-- Reload current luafile
map('n', '<leader>lr', ':luafile %<cr>', {noremap = true})
--Run current line as a command with '\e'
map('n', '<leader>e', ':exe getline(line(\'.\'))<CR>', {noremap = true})
-- CDF = Change to Directory of Current file
vim.cmd('command! CDF cd %:p:h')
--refresh external changes into file
map('n', '<F5>', ':checktime', {noremap = true})
--Quit without closing tab
vim.cmd('command! Q :Sayonara!')
--Add semicolon to end of line with <;>
map('n', ';', 'A;<esc>', {noremap = true})

-- Comment toggle
vim.cmd([[map <c-/> :CommentToggle<ESC><CR>]])
vim.cmd([[map <c-_> :CommentToggle<ESC><CR>]])
-- ctrl-s save
map('n', '<c-s>', '<esc>:w!<cr>', {noremap = true})
map('i', '<c-s>', '<esc>:w!<cr>a', {noremap = true})

-- Control-C Copy to system clipboard
map('v', '<c-c>', '"+y', {noremap = true})
map('n', '<c-c>', '"+yy', {noremap = true})
map('i', '<c-c>', '<esc>"yyaa', {noremap = true})

-- Control-V Paste in insert and command mode
-- imap <C-V> <esc>"+pa
map('v', '<c-v>', "+p", {noremap = true})
-- paste last yank in commad mode
map('c', '<c-v>', '<c-r>0', {noremap = true})

-- Toggle Transparency of background
map('', '<leader>tr', ':hi Normal guibg=NONE ctermbg=NONE <bar> :set nocursorline <bar> :set colorcolumn=0<CR>', {noremap = true})
map('', '<leader>op', ':set background=dark <bar> :set cursorline <bar> :set colorcolumn=80<CR>', {noremap = true})

-- Pack Install
map('n', '<leader>pi', ':PackerInstall<cr>', {noremap = true})
map('n', '<leader>ps', ':PackerSync<cr>', {noremap = true})

-- JABS
map('n', '<space>b', ':JABSOpen<CR>', {noremap = true})
