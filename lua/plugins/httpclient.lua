return {
	{
		"NTBBloodbath/rest.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"vhyrro/luarocks.nvim"
		},
		keys = {
			{"<space>rc", "<Plug>RestNvim", desc = "RestNvim"},
		},
		config = true
	},
}
