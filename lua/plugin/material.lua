vim.g.material_style = "deep ocean"
require("material").setup {
	contrast = true,
	borders = true,
	italics = {
		comments = true,
		strings = true,
		Keywords = true,
		functions = true,
		variables = true,
	},
	contrast_windows = {
		"terminal",
		"packer",
		"qf",
		"NvimTree",
		"undotree",
		"diff",
	},
	text_contrast = { lighter = false, darker = true },
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
