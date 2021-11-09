--------------------------------------------------------------------------------
--                                  gitsigns                                  --
--------------------------------------------------------------------------------
require("gitsigns").setup {
	signs = {
		add = { hl = "GitSignsAdd", text = "+", linehl = "GitSignsAddLn" },
		change = {
			hl = "GitSignsChange",
			text = "~",
			linehl = "GitSignsChangeLn",
		},
		delete = {
			hl = "GitSignsDelete",
			text = "-",
			linehl = "GitSignsDeleteLn",
		},
		topdelete = {
			hl = "GitSignsDelete",
			text = "﫧",
			linehl = "GitSignsDeleteLn",
		},
		changedelete = {
			hl = "GitSignsChange",
			text = "*",
			linehl = "GitSignsChangeLn",
		},
	},
	numhl = true,
	linehl = false,
	keymaps = {
		-- Default keymap options
		noremap = true,
		buffer = true,
	},
	watch_gitdir = { interval = 50 },
	current_line_blame = true,
	sign_priority = 6,
	update_debounce = 20,
	status_formatter = nil, -- Use default
}
