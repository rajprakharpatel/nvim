-----------------
--  undo-tree  --
-----------------
vim.api.nvim_set_keymap("n", "<F7>", ":UndotreeToggle<cr>", { noremap = true })
vim.bo.undofile = true
vim.o.undodir = vim.fn.stdpath "data" .. "/shada/undo-dir"
