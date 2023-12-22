return {
	{
		"3rd/image.nvim",
		lazy = false,
		options = {},
	},
	{
		"HakonHarnes/img-clip.nvim",
		cmd = "PasteImage",
		opts = {},
		keys = {
			-- suggested keymap
			{ "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste clipboard image" },
		},
	},
}
