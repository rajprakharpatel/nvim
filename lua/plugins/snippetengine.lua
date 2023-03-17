return {
	{
		"SirVer/ultisnips",
		event = "VeryLazy",
		dependencies = "honza/vim-snippets",
		init = function()
			vim.g.UltiSnipsExpandTrigger = "<c-l>"
			vim.g.UltiSnipsJumpForwardTrigger = "<c-j>"
			vim.g.UltiSnipsJumpBackwardTrigger = "<c-k>"
			vim.g.UltiSnipsEditSplit = "vertical"
		end,
	}
}
