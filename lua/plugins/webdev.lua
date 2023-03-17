return {
	{ -- live html, css, and javascript editing
		"turbio/bracey.vim",
		ft = { "html", "css", "javascript" },
		build = "npm install --prefix server",
	},
	{
		"vuki656/package-info.nvim",
		dependencies = "MunifTanjim/nui.nvim",
		config = true,
	},
}
