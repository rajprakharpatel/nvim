return {
	{
		"rajprakharpatel/wandbox.nvim",
		keys = {
			{"<space>wa", [[<cmd>lua require("wandbox").run({client_list = {'wget'}, open_qf = true})<CR>]], desc = "Wandbox Run"},
		},
		config = function()
			require("wandbox").setup({ client_list = { "curl" } })
			vim.api.nvim_set_keymap(
				"n",
				"<space>wa",
				[[<cmd>lua require("wandbox").run({client_list = {'wget'}, open_qf = true})<CR>]],
				{ noremap = true }
			)
		end,
	},
}
