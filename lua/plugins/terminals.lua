return {
	{
		"voldikss/vim-floaterm",
		cmd = { "FloatermToggle", "FloatermNew", "FloatermSend" },
		init = function()
			vim.g.floaterm_shell = "fish"
			-- vim.g.floaterm_wintype = 'normal'
			vim.cmd "let g:floaterm_rootmarkers = ['.project', '.vscode', '.idea', '.git', '.hg', '.svn', '.root', '.gitignore', '.CP']"
			vim.g.floaterm_open_command = "vsplit"
			vim.g.floaterm_keymap_new = "<Leader>ft"
			vim.g.floaterm_keymap_prev = "<leader>fp"
			vim.g.floaterm_keymap_next = "<leader>fn"
			vim.g.floaterm_keymap_toggle = "<M-t>"
			vim.g.floaterm_keymap_kill = "<leader>fk"
		end,
	},
	{ "nikvdp/neomux", cmd = "Neomux" },
}
