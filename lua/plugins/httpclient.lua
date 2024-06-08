---@diagnostic disable: missing-fields
return {
	{
		"NTBBloodbath/rest.nvim",
		ft = "http",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"vhyrro/luarocks.nvim"
		},
		keys = {
			{"<space>rr", "<cmd>Rest run<cr>", desc = "Run request under cursor"},
			{"<space>rl", "<cmd>Rest run last<cr>", desc = "Run last request"},
		},
		config = function()
			require("rest-nvim").setup({
				result = {
					split = {
						horizontal = true,
						in_place = true
					}
				}
			})
		end,
	},
}
