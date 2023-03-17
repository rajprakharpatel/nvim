return {
	-- Status Line
	{
		"NTBBloodbath/galaxyline.nvim",
		enabled = false,
		lazy = false,
		dependencies = { "package-info.nvim", "yamatsum/nvim-nonicons" },
		config = function()
			require("plugins/statuslinethemes/galaxyline-bubbles")
		end,
	},
	{
		"rebelot/heirline.nvim",
		enabled = false,
		lazy = false,
		dependencies = { "lewis6991/gitsigns.nvim", "Smitesh/nvim-navic" },
		config = function()
			require("plugin/heirline")
		end,
	},
	{
		"windwp/windline.nvim",
		enabled = true,
		lazy = false,
		config = function()
			require("wlsample.evil_line")
		end,
	},
}
