-----------------
--  dashboard  --
-----------------
vim.g.dashboard_custom_header = {
	"$$\\   $$\\ $$$$$$$$\\  $$$$$$\\  $$\\    $$\\ $$$$$$\\ $$\\      $$\\ ",
	"$$$\\  $$ |$$  _____|$$  __$$\\ $$ |   $$ |\\_$$  _|$$$\\    $$$ |",
	"$$$$\\ $$ |$$ |      $$ /  $$ |$$ |   $$ |  $$ |  $$$$\\  $$$$ |",
	"$$ $$\\$$ |$$$$$\\    $$ |  $$ |\\$$\\  $$  |  $$ |  $$\\$$\\$$ $$ |",
	"$$ \\$$$$ |$$  __|   $$ |  $$ | \\$$\\$$  /   $$ |  $$ \\$$$  $$ |",
	"$$ |\\$$$ |$$ |      $$ |  $$ |  \\$$$  /    $$ |  $$ |\\$  /$$ |",
	"$$ | \\$$ |$$$$$$$$\\  $$$$$$  |   \\$  /   $$$$$$\\ $$ | \\_/ $$ |",
	"\\__|  \\__|\\________| \\______/     \\_/    \\______|\\__|     \\__|",
}
vim.g.dashboard_default_executive = "telescope"

vim.g.dashboard_custom_section = {
	a = {
		description = { " Find File          " },
		command = "Telescope find_files",
	},
	b = {
		description = { " Recently Used Files" },
		command = "Telescope oldfiles",
	},
	c = {
		description = { " Load Last Session  " },
		command = "SessionLoad",
	},
	d = {
		description = { " Find Word          " },
		command = "Telescope live_grep",
	},
	e = {
		description = { " Marks              " },
		command = "Telescope marks",
	},
}
-- vim.cmd 'let g:dashboard_session_directory = "~/.config/lvim/.sessions"'
vim.cmd "let packages = len(globpath('~/.local/share/nvim/site/pack/packer/start', '*', 0, 1))"
local time = vim.fn.localtime() - STime
local st = "let g:dashboard_custom_footer = ['NeoVim loaded '..packages..' plugins  in '.."
	.. time
	.. "..' seconds']"
-- vim.api.nvim_exec([[
-- let g:dashboard_custom_footer = ['NeoVim loaded '..packages..' plugins ']
-- ]], false)
vim.api.nvim_exec(st, false)

-- vim.g.dashboard_custom_shortcut = {
--     a = 'f',
--     find_word = 'SPC f a',
--     last_session = 'SPC s l',
--     new_file = 'SPC c n',
--     book_marks = 'SPC f b'
-- }
-- find_history = 'SPC f h',
vim.g.dashboard_session_directory = vim.fn.stdpath "cache" .. "/session"
vim.api.nvim_set_keymap(
	"n",
	"<leader>ss",
	":<c-u>SessionSave<cr>",
	{ noremap = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>sl",
	":<c-u>SessionLoad<cr>",
	{ noremap = true }
)
vim.cmd "autocmd FileType dashboard set showtabline=0 | autocmd WinLeave <buffer> set showtabline=2"
