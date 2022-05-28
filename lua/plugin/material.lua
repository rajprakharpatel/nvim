vim.g.material_style = "deep ocean"
require("material").setup {
	contrast = {
		sidebars = false,
		floating_windows = false,
		line_numbers = false,
		sign_column = false,
		cursor_line = false,
		non_current_windows = true,
		popup_menu = false,
	},
	borders = true,
	italics = {
		comments = true,
		strings = true,
		Keywords = true,
		functions = true,
		variables = true,
	},
	contrast_filetypes = {
		"terminal",
		"packer",
		"qf",
		"NvimTree",
		"undotree",
		"diff",
	},
	high_visibility = { lighter = false, darker = true },
	disable = {
		background = false,
		term_colors = false,
		eob_lines = false,
	},
}
vim.g.material_variable_color = "#d17CB4"

vim.api.nvim_set_keymap(
	"n",
	"<leader>ml",
	[[<Cmd>lua require('material.functions').change_style('lighter')<CR>]],
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>mo",
	[[<Cmd>lua require('material.functions').change_style('deep ocean')<CR>]],
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>md",
	[[<Cmd>lua require('material.functions').change_style('darker')<CR>]],
	{ noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
	"n",
	"<leader>~",
	":lua require('material.functions').toggle_eob()<CR>",
	{ noremap = true }
)
