return {
	{
		"RishabhRD/nvim-cheat.sh",
		cmd = "Cheat",
		dependencies = {
			{ "RishabhRD/popfix" },
		},
	},
	{
		"sudormrfbin/cheatsheet.nvim",
		keys = {
			{ "<leader>?", "<cmd>Cheatsheet<CR>", desc = "Cheatsheet main page" },
		},
		dependencies = {
			{ "nvim-telescope/telescope.nvim" },
			{ "nvim-lua/popup.nvim" },
			{ "nvim-lua/plenary.nvim" },
		},
	},
}
