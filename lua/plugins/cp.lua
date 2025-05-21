return {
	{
		"xeluxee/competitest.nvim",
		cmd = { "CompetiTest" },
		dependencies = "MunifTanjim/nui.nvim",
		config = function()
			require("competitest").setup()
		end,
	},
}
