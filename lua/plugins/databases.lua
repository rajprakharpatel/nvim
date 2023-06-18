return {
	{ "tpope/vim-dadbod", cmd = "DB" },
	{
		"kristijanhusak/vim-dadbod-ui",
		dependencies = { "vim-dadbod" },
		cmd = "DBUI",
		init = function()
			vim.g.db_ui_auto_execute_table_helpers = 1
		end,
	},
}
